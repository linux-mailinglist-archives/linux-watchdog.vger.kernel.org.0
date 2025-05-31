Return-Path: <linux-watchdog+bounces-3594-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732BAC9931
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 06:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 274344E104C
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 04:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8F228C01A;
	Sat, 31 May 2025 04:08:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA828B503;
	Sat, 31 May 2025 04:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748664506; cv=fail; b=rOm34cYu72RpEI8Zex9vzVLeXuPPN3Sm+PYBSwjzdZ3209e0lJ/YaQyQmCDEjWIj1PSilQQUx/JmxdSVATuOYPiWs/v2nB765Ee489O9beJXgMqb3YYkp3PeSsVWTYtMW1SFlqMOnoskTZbsgCfpxakYcb7u6MhQrvwtuenTWKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748664506; c=relaxed/simple;
	bh=5tgwE8m8TFf/ITWjfVVtpPWACjvtNAZJmh36kvIOqus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S02oMWXFY2iCkzyAl8+nh9pSm8nwTJ8doXOVUUid55jRgxkZLNYvc7hIAxiI2lF2AvrPupTC2BOUrpXs6LjWE1Jd7dprVo798da4ls+4bQ8tAe+SPFLr4AbiFSj+/mrR3qstiUPV6ac8S3k6r2AeLaJg8kWxGEpEV7lu24pX7gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V47wpI022774;
	Fri, 30 May 2025 21:07:58 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm70sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 21:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ysl3reZIkLR3k6QXsgBjnEz5S5ncuhAheyqwpq7EIcoDGRgk3GjaMl/0Az8wt5F/MSMHR60LG7yM0aUkUtFLVPSzK0dSjWvFzLJsVN0H2XzMVSRwtmPiiO5+T/0VLXIWRPHKJBit3+8YqU+7KQ3EZzGUkTxSylAfrHZZp9hGUJaQ+48pbpBE1FcrwsNRUmjR1zcdAM0d29zz6LK4fh17Ax1tnsWkRpUjw4M9JDG9RtZ38G38J1H6TljZcGF0wIJOWLFlH6N6Ir5xXArC2+Lu2JtP3hJHL0rCejDPPor70Ydg+RCE5NCRTtjv9d+LTQF+CEm5nmjFATIFwG1e8KirSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfqxl/xcbDh/bUnRxEScfqXQNwYcHKRTWwx+u4opRZs=;
 b=T2Ask0l2m0wJZFuzYY2sSbspKszRcnoRrvPyZIvy3IMzWqTiFzrjToayhpAJn6z4II2P0XA6e1gIpF1Q6YJ9rkI/OMdY1c7QVaNsNS7s16xuGbDHkN69LoooOvZH9Nf0xenuvWJ+gsbc5cjcOdq4zSYYjAhY2P17Ds/Mcy7cp/TPZdTFqKnpBey89L/RAuVuVrHEhA1+WRnSAzKhx8Gr7ivQvQGsPCH2V/k89yDL+wpkAnUICQk1Kg5i6SuBO4QtpGaFGsiI/dao9w3OwXXu3x64zcenvRt7Uwhj6roanB981pf3n272MMfkN7uC81RV3SK+7ouwtdP/NWd+G2ZT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Sat, 31 May
 2025 04:07:56 +0000
Received: from DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3]) by DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3%7]) with mapi id 15.20.8769.025; Sat, 31 May 2025
 04:07:56 +0000
From: Meng Li <Meng.Li@windriver.com>
To: imx@lists.linux.dev, linux-watchdog@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, s.hauer@pengutronix.de, wim@linux-watchdog.org,
        linux@roeck-us.net, shawnguo@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v2 PATCH 1/3] arch: arm64: dts: add big-endian property back into watchdog node
Date: Sat, 31 May 2025 12:02:11 +0800
Message-Id: <20250531040213.2589292-2-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531040213.2589292-1-Meng.Li@windriver.com>
References: <20250531040213.2589292-1-Meng.Li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To DS0PR11MB8763.namprd11.prod.outlook.com
 (2603:10b6:8:1bb::12)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8763:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5ebe72-98ff-4a17-a807-08dd9ff806e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4FrOse/ZJ3Wuh9bnBjoIrFOVNY2KZxFFKvt+OBXPfx8MvbKl4fo10oSa1MFC?=
 =?us-ascii?Q?gIrJ3S3gwSVJXaGBjHF49l10OPCQ0N7H4gi8GIac8pGm+6G8Y2z6mriHMTmt?=
 =?us-ascii?Q?VfCnTGcfkivrBfqrw5oZAjwDY/EHDBKHxxsy/O+GhlQzaXci8SpULyyB7uJh?=
 =?us-ascii?Q?KDE3QQARbH0qcNv5lj2PgmnRwLCYHU839G/EV92KimFX7i6C0NtouobSUJG1?=
 =?us-ascii?Q?JYoKOW8CjZ+2aDcGZNa5ocLgkdaRbKiLIR6A14CJ3kMTgow3QEfamLE7DfVx?=
 =?us-ascii?Q?G/BdSTRceTA5BNVaTBDn227UfH4IhCpDyEjD5FF0YiM3J0hU4pUh/U1rm3eH?=
 =?us-ascii?Q?1U1JmsRDz58m49Li7Xs+sPteaQA3zHmltJCWc2LStYkP6esHwEvkDgx0U/2/?=
 =?us-ascii?Q?5ciAHSIEu0CIf/2VWhB9lm8zRWEvCaVcpS8TwlTk53A/nWPcBZyjFaF9MycX?=
 =?us-ascii?Q?ay5smO4lVbMGm8nimOQXBvbpr63/g63WgxOtJIdtLAWeN6rWrP/8WLXBS/WG?=
 =?us-ascii?Q?scgpRcxSxqaecFsOiGgaOoEWab/1f4OQuIM8v3d1NBNy+td5QRbnY9i9Of5J?=
 =?us-ascii?Q?UuiKBhpFhl4MZt7PtIx8qZpTOyvQ+wm6c7gZogj0Sg0BSj1j7+e0n4vBXMpt?=
 =?us-ascii?Q?8iDaPwuWK+c5LeT0FhmKuPrkDx3tLnS7uEgEXnTcuE3lYxbBp9wLh680hvEz?=
 =?us-ascii?Q?U2cd/vvDUUIfKW5HBKp7wf0JgAV8u8UYvJ4rN0ikMuGNvvbiWZSxUwi8hKpj?=
 =?us-ascii?Q?IT6vwgm4mbb7F+4KbKtTMXk11crhqpTCfgZun/BV1Af7DsQDymKODeN3hH7K?=
 =?us-ascii?Q?pc+ReAeugzAypuJOdwB+tHEFC785wJEtuhSsTn4l2O5LOJ7ilDjSV+hPZm7o?=
 =?us-ascii?Q?mHUZIyUxN8rsOGW697GZ1M4KdkRQ9jT9IagS/LZAe+HxW5Vk35h+ERTb1Nod?=
 =?us-ascii?Q?sC334iiv2O//bU0edzqBvysbyeRlWkqwN2+oQWupv4hq9+yxyklx2yV8iT5O?=
 =?us-ascii?Q?92l1tXZo8dYoUSz8aQ6iBhzwITC7t06qq0wevMLzbmCkp+O+Vjlt8KN1e4aS?=
 =?us-ascii?Q?44gJSi0FtoWC1whrqKdvU74diHmFP4YUe7+SoKvslL24sGyW81SbXttP/QgL?=
 =?us-ascii?Q?Xo8lXcm/SjKBN7SX8pCSOKJFkyf4X7wrPgw/sI9VtSxxgDavYKJ7qGTYiw9Z?=
 =?us-ascii?Q?4vppPKuwbQoEL4T4gvm0JFYSfCprV0gsTLZ01HWnLGiqcWcHIraxE10Hlyqt?=
 =?us-ascii?Q?TiKEz3EZi3MeX8EP5ZjN9DzTnZp/npUpiSBPdfDOt1Xzg+m96xmMbLX1ISi1?=
 =?us-ascii?Q?4Z5ZmD6k4q0dAF7sZdqxKT9YuNww7stanL+ccLV4fGrDS3CgaHU0waxBS7BR?=
 =?us-ascii?Q?HlnO+73bA1Lfy5SO9WAiC9Tbl+F43ztB2HwdoDsx3bOfajpvPZVzk72ASDGL?=
 =?us-ascii?Q?JOz6+Jd88wXYQYey2qb4O2weMlBxXw19g2x1FSs69TG2iqQPmhihnQ/egNN8?=
 =?us-ascii?Q?02NNyApTBlr4e7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8763.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ishVu4tiWjtWx6RCc4TajE24/slq/JMq/IhkGOQg2s6E4BjzYEYFzQ3BLqZ/?=
 =?us-ascii?Q?JzVI7ZmJqWet951s8etxThzn8UaXbXyONC+46pWsp9SwFKjIDLyJ6W34Rhwf?=
 =?us-ascii?Q?/reDS+/aBhvsJGBnehojOi/8H6noqV08/Gs/naslkttzILXyq5uhK7lLsqrO?=
 =?us-ascii?Q?TmeprqkXpet5+Ys30+nUL30whyzGbg8BU0ebJxDgx08zgaRLjyVXDmlc5CCb?=
 =?us-ascii?Q?Q54iiOl936LXandce074mw8SDBU+jEtIQh5MZH50C1tFjcxczOlQxuyTkEtV?=
 =?us-ascii?Q?mUZe2ndT37UJ/FvneCwygKxdYG4m2W9L2g3iLJ+aolTYZ/oBwuczeg6750ZA?=
 =?us-ascii?Q?96CpjCD8/Lw+jA7lh11/eOjapWbkbxqXscaQifOrqLRzEcGWJCuIaOEtQOzI?=
 =?us-ascii?Q?t57anv5ge6av+uM2DfqMMd5Nf6q2E5vlwHxD9MTXN+UjpQCo26lFg7xzbvI6?=
 =?us-ascii?Q?3FttZC5CLPiGw0wjcufnKj2l70fd+VYt3FkAXhg1xPf4yA5a+epCky0dYdXx?=
 =?us-ascii?Q?rmwM3rnX4a14fbx9Yk7QkxA+b3Na1HMDUvh7Y2DIJzmtTsEJJro+VUzk8Oiy?=
 =?us-ascii?Q?hmIXx0H5mrlKjUhjSyOKrhRsILcqsItD48mvQtZJx/4LyCYR0yJre3pP3Tjm?=
 =?us-ascii?Q?R0bGWiE0wSKm69xZ8JUnoFRL4hO0c4X5tczbfwN/1aCx/EkZnFk6jgKHyiWM?=
 =?us-ascii?Q?drZi17WKbIorum4mFWcIONRiiC0rgPFLtBwBITZX8KD0qvKnwWCrPbTOQcHA?=
 =?us-ascii?Q?W6EBZB/y6LUHSl28zUmpvdzIu2QrUSk0ECDgF+dS2vbO4SYCIIm2IjARiYBj?=
 =?us-ascii?Q?PyjzWQ0RcncRfT8CW/T2QWpAdb5t8AFK7hanCz1K1Ob1EiB0JJoAFVkc1iqy?=
 =?us-ascii?Q?VrL4+Cw1yuKTV7mS1eZLykk4KZHwBJgpJ5XKR4YpztMaBYi9lv+gIYY2CcKl?=
 =?us-ascii?Q?ZPpjNss1dMsSpgDLk4cMaqqPb1vOH+PuAXh0iFuq3Fdn7XvvCIeyGE/x4kz9?=
 =?us-ascii?Q?q4vCUiFQDgnerR0K+AFHxjHRZMTtDXPzmwerL/rHlsPkKMiBiV1+yM/D7WvU?=
 =?us-ascii?Q?WqXiT+U0YVlHE2dTHJpHEiwu6Y01eTIAy/5S38eGyf+8s53cAACcNbHcHvZM?=
 =?us-ascii?Q?Rf2THlr4JeBsvCyNHL8lHy8Cqzl25FhlT4PT+WRV07mx5qYqSPVmOjdLo4q8?=
 =?us-ascii?Q?OT0/Av5o++9DPFaNuLx3NvMbHfRjhyCYc29f7UDOG8gedgIYsB9lqVVd/M9C?=
 =?us-ascii?Q?GGd9ULB2epTGXxTeOIsrWjbUAMUkKASRmKnF7WVmGf7NbbRPwSgG+5f9Zfno?=
 =?us-ascii?Q?HfdTYMSwHijGJweqYNQN31CY16HFldkgIHg4TZjUzAv45kL4q5EgI8RiFrk9?=
 =?us-ascii?Q?5ABdIMvFoMsq8wodvnFZSfSNVmdz9qZEvq+4vUm/EKdlXlXhAGT+6o5hO8Lk?=
 =?us-ascii?Q?Jf8nWEFUcevqwEJTKO/30K7KYFzpWJsjkSIr4Lasm9WIFcglFBb5yJmOgQbp?=
 =?us-ascii?Q?ExPdmzpYyGqETiADr45RdfMxsAVvCOwm87pKT4HBt49R3d6imlTeOfiYuos2?=
 =?us-ascii?Q?g9F6s1EmnssafYJytLlzYoRUteq/ShP4kU3Z9/0a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5ebe72-98ff-4a17-a807-08dd9ff806e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8763.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 04:07:55.9470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TCiFfjjzwK1GOwwXMfZ/QFHqW3I5DNFARBQ7Z3cjSGtn1uaornWmPJ7Rrb7C/AW8u2cwqRVWetG5jWGUgwLYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=683a809e cx=c_pps a=7ZAoscB/WEXDM7TOYn+1yg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=N8_2f3WcjlOfNawuRIgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDAzMiBTYWx0ZWRfX6+9HytNjo1em n8PqO2AkxUP6mRGSNJ89TuPoSCAMo0E47qAofQgaLfmfCDkKXzWitxiIIVQW0WnElRnPxM5jmhe qhB7T6dZKDrGGl/ERMUUpQXWrUkj7TalFaGoy5jo9SJpbfOcmZKdhKVbLhrR7zRBipeOPOIEAW4
 SBWnwv8QnHiUfwK8u/dGGF+remFm2IupPCXRc5FfB5Myv0yOtP98igBGF15iWAf0Q/qknAAVCkf 7s2G/mHx/skrSd7aUfocHEiwDjbttURYXMclTJ/NKIPkEpDul4K1kB9/A6gmNI5lTXaoG2UWU9C n7CCvsJ8gul0KG2bQVVkUPqTPWPZk0s+Pbx+s2iPDYDRvnwZS8Ilp4Bc3UUC3LEd0b6JCteEwG8
 Attq2iM24EtPvQvSaBCeS3AoJbc3q6oBVe5lA2sJ7OFBqDOcnOTkwb1vqpDeL7AxOfEzPLrb
X-Proofpoint-ORIG-GUID: fYJuvm-jOkcyB37u20H-0UJbxo35Z110
X-Proofpoint-GUID: fYJuvm-jOkcyB37u20H-0UJbxo35Z110
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=914 clxscore=1011
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505310032

When verifying watchdog feature on NXP ls1046ardb board,
it doesn't work. Because in commit 7c8ffc5555cb("arm64: dts: layerscape:
remove big-endian for mmc nodes"), it intented to remove the big-endian
from mmc node, but the big-endian of watchdog node is also removed by
accident. So, add watchdog big-endian property back.

Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b4400..d1c64d97bccd 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -692,6 +692,7 @@ wdog0: watchdog@2ad0000 {
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
+			big-endian;
 		};
 
 		edma0: dma-controller@2c00000 {
-- 
2.34.1


