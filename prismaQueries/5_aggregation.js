const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient()
const util = require('util');


function getMeanCourseFee() {
    return prisma.course.aggregate({
        _avg: {
            crseFee: true,
        }
    })
}


/** Section A */

function getNumberOfFullTimeStaff() {
    return prisma.staff.aggregate({
        where: {
            typeOfEmployment: 'FT'
        },
        _count: {
            staffNo: true,
        }
    })
}

/** Section B */

function getTotalAllowanceOfStaffByGrade() {
    return prisma.staff.groupBy({
        by: ['grade'],
        where: {
            allowance: {
                not: null,
            },
            grade: {
                not: {
                    startsWith: 'S'
                }
            }
        },
        _sum: {
            allowance: true
        },
        orderBy: [
            {grade: 'desc'}
        ]
    });
}


function getTotalPayAndNoOfStaffByDeptWithHighTotal() {
    return prisma.staff.groupBy({
        by: ['deptCode'],
        where: {
            deptCode: {notIn:['DPO']}
        },
        _sum: {
            pay: true
        },
        _count: {
            staffNo: true
        },
        having: {
            pay: {
                _sum: {
                    gt: 20000
                }
            }
        }
    });
}

/** Using Raw Query */


function getAvgLabFeeWithRawQuery() {
    return prisma.$queryRaw`SELECT AVG(COALESCE(lab_fee, 0)) AS "Mean Lab Fee" FROM course;`
}


async function main(argument) {
    let results;
    switch (argument) {
        case 'getMeanCourseFee':
            results = await getMeanCourseFee();
            break;
        case 'getNumberOfFullTimeStaff':
            results = await getNumberOfFullTimeStaff();
            break;
        case 'getTotalAllowanceOfStaffByGrade':
            results = await getTotalAllowanceOfStaffByGrade();
            break;                        
        case 'getTotalPayAndNoOfStaffByDeptWithHighTotal':
            results = await getTotalPayAndNoOfStaffByDeptWithHighTotal();
            break;            
        case 'getAvgLabFeeWithRawQuery':
            results = await getAvgLabFeeWithRawQuery()
            break;            
        default:
            console.log('Invalid argument');
    }
    // eslint-disable-next-line no-unused-expressions
    results && console.log(util.inspect(results, { showHidden: false, depth: null, colors: true }));
}

main(process.argv[2]);
