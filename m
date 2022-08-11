Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193D258FB01
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Aug 2022 12:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbiHKK4r (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Aug 2022 06:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiHKK4q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Aug 2022 06:56:46 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5487D1D7;
        Thu, 11 Aug 2022 03:56:45 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B95Qhr021745;
        Thu, 11 Aug 2022 10:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=KgyGERKptm7zgbdRIFkq/sUOw1ROeDu0O2GY4KxIfNc=;
 b=IyPq29V6Fg89noDVNsXQTUwNNsfABjWbSsgWmTlMyE41LVBwjRzPbLnu5suMs63wNJQV
 jfP6eEmAIDAWZgYqzpDhfPWEmm8dsdKLt7BNAzFRl/UyrMJt3Qp5FMYQjGvbSVLZLEQz
 7T6icK4brXOx50dNLxM84J31wz3iyq2lsA03QsO9q8QsoA7LMupT8Y3PacZWQx/0HkgO
 ggTUtJLkHrusSIttSirwqSWvls3I1PLbSzGaH3IBvecbtoQ+hqGeYgRubkjOm8hh8Z8v
 EWw8GJOWR+dnMniZUiGwAEexeIqAeajbUKyWbI+4cfhyEZzP6npEem/sT3AVIaHGONM2 8A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqj4avk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Aug 2022 10:56:25 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27B9D1BF023713;
        Thu, 11 Aug 2022 10:56:25 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3huwqh0s74-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Aug 2022 10:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDtWYhv/eDKDtm44049xnl6PmC1LE3vMPcx99ldw0VxWlBiKt4y8K3TC1jw9S9IWO1rAR+jQV7z1wsmwpfhzCDpR7HdRSOiOvATRT0Ur8LkVLHamXNvwG8ke2AX8DxdzuORKpEVH+cs+KWwJ6itZJOD+WHgUktlIiRQX1heHkRpblPxslKO+bvUy43vMDCIOjPvtzqeIAHN/cz+M5NGzhBQCplb0nkZnFp/ZPQ92TUejmCG2DT/WqCtcvZHM4oMRMFcR2DC82J7y1isD3mllN+7thv/ZrpvEh9EaB3lUUouXwjgdVoXAbPIJMVq953kO9Mq9+Seo/5zEWcYelyGbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgyGERKptm7zgbdRIFkq/sUOw1ROeDu0O2GY4KxIfNc=;
 b=ieQWmUTkJnhli0g3nSKuVea6lBtGXUnBBfEPFPO94Jd8QXd7IidJCV9KcbN3LefsTJGalvdTjjVvUkJ5qfQGsCsmYemkb9qdHwfKuJgOZstKOd14jaOr+sDhrD6R1vyd0jS1LNaQX7MGm6McTus3KvElqQgt1xImbIjP7Ayq9c+Qr6v9GkOCL+P9aIrqWYNwQcxZhhC8rzjliOhUb6MiWX/OweiaY7BsZozuvOMZkylw3I3CA30woWoc3kopFJZHX1gX6s6t+MaIxreIM+8Uwno9VY05OxNpaFU307FwNkg03vhyo0pT9bBTYcqY0Y+Yy0UU8+30Q24vvMfO4I0F4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgyGERKptm7zgbdRIFkq/sUOw1ROeDu0O2GY4KxIfNc=;
 b=kqSFyTKzesvsseAsukEsDZcbQpQ8WAK+pYd+GP2PD7TfXWVlomIlFxB6L6J5eDvnvWL3Yp6X6240Xz0E354OG+FX3aHd46vMq6w4VWM6iVDnSoqXVIBkKalpblfCZKiUYe1B4NMnyIkqfzLqAsNYmwBivQWmPkGTfcJODrD5pWI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1708.namprd10.prod.outlook.com
 (2603:10b6:4:e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 10:56:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 10:56:22 +0000
Date:   Thu, 11 Aug 2022 13:56:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] watchdog: ftwdt010_wdt: fix test for platform_get_irq()
 failure
Message-ID: <YvTgRk/ABp62/hNA@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0152.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696f6a36-94f7-4201-b096-08da7b8820c6
X-MS-TrafficTypeDiagnostic: DM5PR10MB1708:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mD+l5W4arJcjZkSjZPGVtPbuLijQOPIqTgXRe4VLcJHt0B7RC4CIoppsYkDrOAlmWL7cUwrAsyEemJuhrNFatHDc7kyItcyoYrbXdCUIad1nmacz+9o2TIzk68uv6S5567TKk7c37EZ5CytdOdxgTtL61Z+KMLodTYB0UXz6Ie3xzdF9GqiJhntLcYzR6QCiLOXOAkKIIp13t+Z16KqRoZaFa6O1C+XrTl0Wxo2qygroosLIGB/2IhVx47H16nletzQ6SNVd6T/JZmbAonwOmlktv1E6x0OH7qE+05+SstZwdEOVGoYu8hYBuXRx1Wqt7Wp/vP2hTNJmFuq5XSU6pZFlQKvLptSywK5YvPo6w9MfJOdg1nGLixJ1Piyb9aMufS4jShmz5lyFusDWjckNG+bwXTsmA2AC4+kUJl+sgYvEPrMNNYmB80w9O5P+23r43hqbFPhbKxBDFnsqF+3R8qd1I/TbZ6wH7vHByTDrRYGiJxJESzOkvpRGPxGDKJrIv2hXyPhLzB64xhnCj6oMcgszif2VD1xbmVoHPI44AgbyNwGevn5MCBAZlTTgNTBmn/cj1KZARlxVhTNm+sliH8bJawZnvGWAML/r95lNt2/TfmL7nvF0YzieHq2c+zdcv1QV0eHg2hzIpJogCf4tZeoocjKuZwHBJSrHPdCx/O+7sNWZ/C7vsmVZMIZTNHkLpsJOvwPf/WQPrK6Q6kBkiorSqA7aIsD5jENBcYiVN9rw4bY1EsVFRNyWjztRIws+sx+TTk8qohoIec/tbssZ/wo9s1+IPZnJ7RIadOXCxY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(44832011)(8936002)(9686003)(52116002)(5660300002)(4744005)(186003)(38350700002)(33716001)(38100700002)(2906002)(6666004)(6506007)(6512007)(26005)(86362001)(110136005)(6486002)(4326008)(316002)(83380400001)(66556008)(66946007)(66476007)(478600001)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlMnUhy9KRgCrbq0Ha2nL7jCFmU94PVatH0YgvMwiN1tpjH1uUnm79oeg1bZ?=
 =?us-ascii?Q?L8dWam3DfmGXd79e/9UXR+folwaFB4NCWvCgK3x0MOXDgnE62DCkrEFKw5rC?=
 =?us-ascii?Q?iqpY++ouzV2lOcvxltO56peWjZ6+ME6VowV04aSclU3jHL3FUWGvPRbr7N1w?=
 =?us-ascii?Q?sw7xbVGuf7ksHSPXYkWdnDyj6VOBEYvCMSR4YKTflWGzZEvpOZICZpywm/1B?=
 =?us-ascii?Q?O7emlKKPpXqKwbVg9jF7a90HnwaGrCsZNy7et8h9eU3wvYeHT7NVwWw5QM6q?=
 =?us-ascii?Q?Sj0oZJQ52LR2M58WdUctyO6fALFO8LN1CYnLlzmCEczBb3hR3vlvzWTZyN5k?=
 =?us-ascii?Q?ssMQTXEhOImjNzv/z2+1jvrhYyV3ljU2sRkq+J5xfaluLCtjgDptZdT3iiTm?=
 =?us-ascii?Q?4DQdFEvhVCcdGMFQPv1BaRTbgnAzjdJcnEJUMyLXhjmIS1P7RIrBw2Y0rJbx?=
 =?us-ascii?Q?Qwi/wJiLI4ICpSTXKz3Iv54wJwnOcxo+Ef9Nd2/0kvIrrl+5X5AHFIM5SnXp?=
 =?us-ascii?Q?Cg+Gi8R5mSd5vJo288IRSJOzq8PxEq15GpT9zWLOTZz9i/4h92MDCGaHdLi6?=
 =?us-ascii?Q?lVeJUgEEA847fN1O9Jg7bgpRfsZnJnPCnbwmBJlZ+pbx95gAZ2XdZNYaoxbf?=
 =?us-ascii?Q?cB9TXWIjP20eWgkLa5qemOypRs2ZQnaiiHTs5xT6XOy1F9+YUmrEg+xsyshM?=
 =?us-ascii?Q?5fbcDs0chUTcaAcD2J8HlRBIu/XeeZj7H3HTFotngXWBT9fkAyxTPmb6IqXj?=
 =?us-ascii?Q?b7gbAUuCym4C+5udjQwiNshrbtDUuL74yo5dfkDUwDN73ALk4iLY4O0ycloq?=
 =?us-ascii?Q?A6lmQaRA6+kBIVsYRA3nPE/ap91pQC9juQRiJvj3HEyvnGumSzi3rPKtphPk?=
 =?us-ascii?Q?LMJTrXRik/IhxFGDiQcdEGtzQmhYEbUOOn8uyjL77O6WCIAH6yC8wEQVk3v7?=
 =?us-ascii?Q?w6J2OMmICfSfVCdNXuw5TPugoAXp0qixufQf9nHadILGD0l7gT21H38PRN4j?=
 =?us-ascii?Q?4P3yR85lQtCCe1MX1BZQUcsb6l2XPnu+e/QWdM//31HXY8r0zL+Z11bqeKCF?=
 =?us-ascii?Q?TC1IgwvbDLpMk2UTQvRabt/Trc9Ypz1pHy63OXTnVZtHb4SfzaUSq5uLwyuT?=
 =?us-ascii?Q?wh6rU36K6fGjSX4eMFJN3iM13YOs7PESwzzl8nn/EE8sjGRgwxWvhotZU1dK?=
 =?us-ascii?Q?i2EpMc22rostAG0ovPWF0XJ/8Q5p4Pi4lUj+WVV7BD8/1LPlBMT5ujKcZU3A?=
 =?us-ascii?Q?txY789XyislAB1rvtSrtmufSkxU9PNZbUPtlsy3G8BclzNMn4iu+aTTY1BlG?=
 =?us-ascii?Q?rgoNm7yhRblkw7HVzTMVg3IMEQnjBG8sgLV/anYpPqBii34RErzL5kT2aXD1?=
 =?us-ascii?Q?v6+FmZX4ohfEWEbLK8CFb5RipM9bD1tSHlfcJzVmSkONEGqX2RkF/Njsw3f0?=
 =?us-ascii?Q?MTjJRD9E+Rw6WKVxfj5Gd3a+4cWgl9+h9JGaUqltnm7Q4FtthiJbzBbqCCZt?=
 =?us-ascii?Q?5XrPwgwuarhTy/nK43CLoSHFy7X0WAo7s2lSKCE5bYueMJYqo/hVEerU4E/N?=
 =?us-ascii?Q?BDoydwbhUePD4O6iZMNQRVfVCXkxeMqZZHwmbqA6nL4QlRnhQCtA2LiH7pby?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?w9+x1CgbsJQymIGKQJ9risVCjkjWeNAlJT7DWJtCMk2RSABGIe20tDuP+X0d?=
 =?us-ascii?Q?LM0UnwncOf2qY1fQA9cLBd0RuVWQdFD2VIGZv4qArJ652Mq/+gBJh5MMDQ9N?=
 =?us-ascii?Q?cnyzOmuk5NeAsgmjc8DBSMiZU/c3LWQnfBK31SUGxVfdr8l77fH+YlIOwYpM?=
 =?us-ascii?Q?Q07rpT1wZGzCJ5OtQt3/SxUubek0XsNg0v/mY1eyBQKqCGNkA+wQSA+gzfTT?=
 =?us-ascii?Q?meulNS696YxeYaPndINCjJGPBdhwrPQsbuFuZ7QAX4778IMYTdKP6qR8aNRI?=
 =?us-ascii?Q?kVdM1n2MJNC9+O46WY2Fu+ZOWdbpNPt45zwWIFpUfjywam2c1t0iJmAs2a53?=
 =?us-ascii?Q?Zem+bZKOzlyec/aWSWmRpotT6kbZ2eAIPVPHywyudXHBGsR63ER01qmuIMoC?=
 =?us-ascii?Q?0U724c3pw2BrGH8YeWSFNkX1Y3M454uv0aK+c8DWUJ8c1mPDxiDdWKr6MeJy?=
 =?us-ascii?Q?p5Q8B7p/D3MsZDuQ6M/WKtLavENnrnOB0b5zS2abpvFpaj8fMTReDU8OyzQS?=
 =?us-ascii?Q?JwzmAarJTFWrRuJFo+Pm043j5vA20ipq6ZyGt6X/w9ycPPDSlTDTnonI8kpW?=
 =?us-ascii?Q?Mw6hi0buSymslDQJuwwWr40ODjCe2sz0kmu4Y+NI7wX8b4WN6/S+tj2VW6en?=
 =?us-ascii?Q?osSdeGf2lNL42vB91AAR1v+dNUpN4uIkkqB2uRC5q4hFbRmVsQOdE9T9EYro?=
 =?us-ascii?Q?HFZEtDkBxFCwODITpJnX4x2rRLVPj97IHviP/LoEMFvYaSa325iPbqjChzmq?=
 =?us-ascii?Q?hP6sxvckByPZ7rvJpXYfKFGN6KlvhzaRGTH2sCPycRsJFB2VhsYKrMMXYvTI?=
 =?us-ascii?Q?mgzMU5i600raOp0eDmX53Za13mlXv0+q899+3rzezqQ+gnLDMAZTWISvAhrj?=
 =?us-ascii?Q?NyMOnCLB7cAIQ0RoBahjDggEv1zgRyyM23Cf/Is/DtfJPcfZO7x15dkkYfHQ?=
 =?us-ascii?Q?0A5Z5eoLBnMVEDgx86tZM8b0Z3gd4ZMw0cMhsVuiqF1D55vTJn/dL7qiXLFu?=
 =?us-ascii?Q?m7wW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696f6a36-94f7-4201-b096-08da7b8820c6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:56:22.5600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viZ7jnZGomwU5yQYH3CZnOrqtqMdzmB1A5ArQr+g+AtkTY4NyDp6xZHhFv9eg/G6x89aT6aNz8H74GUqPh/ol3BDYtOVlvDqyKEnjC/qtLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1708
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110032
X-Proofpoint-ORIG-GUID: aqwFlpAqBdnYTJ1qcZrAyqfJMnq4-nyo
X-Proofpoint-GUID: aqwFlpAqBdnYTJ1qcZrAyqfJMnq4-nyo
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This code assumes that platform_get_irq() function returns zero on
failure.  In fact, platform_get_irq() never returns zero.  It returns
negative error codes or positive non-zero values on success.

Fixes: eca10ae6000d ("watchdog: add driver for Cortina Gemini watchdog")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/watchdog/ftwdt010_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
index 21dcc7765688..02112fc264bd 100644
--- a/drivers/watchdog/ftwdt010_wdt.c
+++ b/drivers/watchdog/ftwdt010_wdt.c
@@ -156,7 +156,7 @@ static int ftwdt010_wdt_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq) {
+	if (irq > 0) {
 		ret = devm_request_irq(dev, irq, ftwdt010_wdt_interrupt, 0,
 				       "watchdog bark", gwdt);
 		if (ret)
-- 
2.35.1

