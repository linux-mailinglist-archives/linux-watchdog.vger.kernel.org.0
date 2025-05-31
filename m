Return-Path: <linux-watchdog+bounces-3595-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF9DAC9934
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 06:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51AE91BA711D
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 May 2025 04:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257942192EE;
	Sat, 31 May 2025 04:08:31 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D63928C2A8;
	Sat, 31 May 2025 04:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748664511; cv=fail; b=RyJGCpMJrDIQl/3plobUHgziOYmbVhllfLsaLJ6MCWudM8lB7DCt3jmXTdiKh4ivbCOJ3MIF6mEmzPpDZqO82JkdYk0JHkO3NmlrhiaVtxZCHImy2eC4FJXgqVNHqrfTNoYv/EKqSH6rszKZXvrs3WKCRQlCsZu6f1qzhwlN+2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748664511; c=relaxed/simple;
	bh=ROj9xZMvzSdb+38su35mkrBlwiLqSr3c1V30oJrnO8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i5y1SVSGMaCT+Xwp0Pjw8QztfGtWd/OYJ6Cq6oPs7uZ5pdbFJF0mv+BJc1HdybsLvhEztf3NyChjzV6HrddTD4Zd3sPnBHipZWt2LgTUp/IlLFp9sYawzkivUKq6TcrzuiuL7/Vw5YRS9DXElvIufdsR2FKEl89Q0MYwmXDu8xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V431LM032393;
	Fri, 30 May 2025 21:08:02 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d4776p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 21:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjXhCRD0qfWcHJ3BZaPV07XQfauol79LJbAcDOiuihYcUgmpuHU0EVaR6YboanR+BauBjYtjpgHMseTu+I+vU449tqPIH8+G0xOaftyM1ONU7CzBI/zfh8bsqsXSSrB2Vo4zBHywDegMHfAH+6zQYLX6fQKqpwbx2iizOiwfTAZzdgbSFakLlwDB7z2Ql6QCXmODukpuB3myAa9qVZvw0MASNxC+9Rd96vRrTkgu9dWTVL1GTZM7fw2f0kaF3hMwk5Z+DG/9C82w+Ejj+z4cMm3RjdIz/Bgcliv5TpOBOH9QYiAn6sLkaBkb+yMlrXQvE++YfyZPDq4yxOXjvfdCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHzQ5hz5bJ2vJgOTZV59rwE4yTXifaDigIl6K+kL9Js=;
 b=o2zWHJ1BuI6JrtuEUe3YArBUyNpnhkIeeKzbSxwDdSa3+YP4rfk2z29+t/3MzCAfwAO04gqhHSK0Tv2kvoU4CFoQF8aYjPk6IQOF80DsuR/AdTavTslxpWSF8O7T9juuIuSGe68cHJhVIB1fLGFajXg7z98pm2bRCTyxJ4VR93n1ZFh882SbMAQN0lXzKhMqYrMPSrwqlT7kYp8fUqTZgqPXKBgM5l1GGcR7m2KvYZ8MiRDjxv2herqIZx69m+TNtfEufuDk0LXvC5+G+fxcqKSWcBxS1wFBSGIF9L4CWzE0NTyUoPfCDAUJfvzObifzosScen2x8nl2g0belXGfww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Sat, 31 May
 2025 04:08:00 +0000
Received: from DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3]) by DS0PR11MB8763.namprd11.prod.outlook.com
 ([fe80::efb3:ec61:3036:be3%7]) with mapi id 15.20.8769.025; Sat, 31 May 2025
 04:08:00 +0000
From: Meng Li <Meng.Li@windriver.com>
To: imx@lists.linux.dev, linux-watchdog@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, s.hauer@pengutronix.de, wim@linux-watchdog.org,
        linux@roeck-us.net, shawnguo@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v2 PATCH 2/3] arm64: dts: layerscape: add platform special compatible string for watchdog
Date: Sat, 31 May 2025 12:02:12 +0800
Message-Id: <20250531040213.2589292-3-Meng.Li@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 55df6cbc-7ca4-4a80-0354-08dd9ff8bb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rU94J/IfHEAGuCD6P81u5CaOoAhh90nhu3Cug7eS0uIiniFqVy5ScszXSzw3?=
 =?us-ascii?Q?q7bkxi9yAB2+U8pS2Sn6q2We1/a0Wo1lh1OiaL59hVR1AKKn3+ZNnFqx5Uj5?=
 =?us-ascii?Q?FLyPm/jM3MD4SoqKZVYBYHaOu4h3KD1Q+eQR8khM2RnAmiCtabeZqgSvtLuP?=
 =?us-ascii?Q?z1KkEe+jN/dygpjxZIWVmZEa8m/ZyAyWIzr1sWbUfbO6A1WzXQ+I+LwJlgz7?=
 =?us-ascii?Q?7imxJEH8vvFukT+S1YF/Y1MrSr92YFp9bgf9qFwsS48OTP2aKwvbGA4+gsid?=
 =?us-ascii?Q?yB1ZMk21izMtmIUgKki3glS5xsMJTcLEB5801qP2GzFoH1Es1x7AAbpOcUK3?=
 =?us-ascii?Q?Pk3McUQj1Iozk0taJq53ZlPlP77FDW4xdBI3g12ERy7OMnIxE7h3kIL31vX1?=
 =?us-ascii?Q?a0wP338UgAEVMxhoFHzUHcelzBGZZwBINunil/nLHGVFomo/7zFZBv7diAFQ?=
 =?us-ascii?Q?2o2xPG3YVy8LQjlNJ7Nq8DiKPO1f1I0b3ypPNfUvjp28MwRlsdfhhT7+7PFq?=
 =?us-ascii?Q?a71kkWQDQrmplyyOjrmYc7gv9/OkjUaTJyZZug1IM/hH0no93r+QKGVq0et0?=
 =?us-ascii?Q?6qUVADIFkP3DWwfGoQdluJqw4UtXmtSWT2qx7+3IfvsFDoiANBE+A+h9ON/y?=
 =?us-ascii?Q?gwTEtg2vErT9ECzKrbolYLpOXVU0q6Q+nrRZjuqa9AQr8jz0URqcelKUQr3V?=
 =?us-ascii?Q?J+l4DhPbzQK5KAY7F6d6tTCI4rKsDD3R+1pBPQ82UJ48zP4U4xcFauvZJ16Y?=
 =?us-ascii?Q?dydoq3pUgitB6reinSQGj65n89b1bN+kGjbbjThc8IMR/B29JQ2KVmQgsR7j?=
 =?us-ascii?Q?4czmU7Xzz4xXLrspd/69mDAzX/Noeon5mKW0UmcNTQJ3GW2QG2WOUO9/3DtZ?=
 =?us-ascii?Q?NL5nrFO1HP/WNm67IA5ySCuG4Bjey4sWTGYES7C9lCceY24tL7Z6soiKG5pc?=
 =?us-ascii?Q?hCJlSbIvo3RxQQIFDi6+89xdgGMUyY8nVFsx4qSF8aDsBkwUQAsuABlIlMaD?=
 =?us-ascii?Q?YXGw176yZIpoJraBUgDYh4pq2zrLioL/m2mlOvcOV6XNQs25dIbClwcZmWeq?=
 =?us-ascii?Q?GkhVFvZZlCG4yk1TIZlcDAB+yQvOXdfdMaE7aDgHCEfRSBvPahd+DhX4HWWJ?=
 =?us-ascii?Q?WL7ZySAuRzqKumRV5KdOvOafa8klmgOeikVjD1aOKwKq+aslDpsC6zuovSLZ?=
 =?us-ascii?Q?DeuKPPuoM3OVxoYbjbIXlQL/niE7A7yxWz4g1j3WSCg7aSV9ulNnRPQiU2un?=
 =?us-ascii?Q?8ymt2anFN9Ry8r1OBjed3uEI9nXuSXdfuYMupusWgmCnwaSZbt0qsDal+R4a?=
 =?us-ascii?Q?chKtnY24YYx6Wy5rkspooTn0mTK6HW0KCZv7Ob9gonD53fhzwt1t2wDtmY41?=
 =?us-ascii?Q?ck54SgNlWp3w8cclBE+qS6n1jJW0o0x9ElWP1LttR1DGHWs6gttY6Frp9Pwc?=
 =?us-ascii?Q?TyIZQpH622jjDXiR9qopHG/meg/EEnqI6ZXXjAmoy8fRt94Ogle0TXIE/4Jt?=
 =?us-ascii?Q?uYu2sDxCogMN9qs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8763.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0VnM7OeOH+YY11jU5jHOTvm6NCfo4ugSXENNoB68LfSuIPBYLZzaCR9PPB/m?=
 =?us-ascii?Q?vRGa+UM0RHY3dMaShR1F0PmsMKqxuoHdhvRb3MVv1sAxLckcBJ6Z8GEbT/at?=
 =?us-ascii?Q?ykhqiQ3LZgUd8l9HbA9ERYizcHi0PuwhPybcija+tXpJD5Zgb+bH/bPrNooZ?=
 =?us-ascii?Q?kf2nIVhqRPIVX5u9yaAwjFCxdU1N3tyGBNgc0WSljWQoR3fHNp3zjVY6zctA?=
 =?us-ascii?Q?qpcI5jEtJORqPunQgmQhotANi9SpBSocVhad+hvH7FYkJbqgI/c3bUhMRmZP?=
 =?us-ascii?Q?AwtiAOQNMVMedo89Xj7EigMt8gwahdtG+5iKcAkmoaBultFD8WFn1xy1bcJj?=
 =?us-ascii?Q?n6tctdwyWdrbiKCAWUXF4N0dHluuw5ZWv+BEN83/Fbn+5evzBaRpX1HjPTof?=
 =?us-ascii?Q?tUHmkg1I8+eDc06vJ0ShnaWAWxtnj/89FWDc24WF+S6kJ8vTVNI66AuKkuuh?=
 =?us-ascii?Q?cjmsa9m5NV5aH2iWZwM9U/9XRW8nVCgoi4YwrLlogtHoDmveaS4IZmTEcJeW?=
 =?us-ascii?Q?f5vl9CPek5GHEKNWJ+ZorO08FZmjJfkwXWOhEhxO7IbLClmUxk8glskoy6QX?=
 =?us-ascii?Q?e86nZoMvKCJp0ASKQ7LfcCeM+KufXadFht9qyUB1KB9tHc+iMvAILvj4YUre?=
 =?us-ascii?Q?qR0ghbyBtEXaQNvR2GHqTCjPWyU/v7P5pmYetDvQet3cCAy09ieVUFAoRgX0?=
 =?us-ascii?Q?vAYd09YTEk3/Ct58qDidSewde2zKF5OR+vEE7JqZgDBt6O/dY/v/dCNOtLKv?=
 =?us-ascii?Q?RgZbb/HOgp8zTHzFxS5/yf6Ws36PFsJhuPXl+cpsZAkE/r88wYv1UWbHQEu8?=
 =?us-ascii?Q?x/Et/SSbaRkGX0ryr0sucSUyAfr1Te5gdd8jH/ym4wC/enqxONTEoUnw9zuZ?=
 =?us-ascii?Q?DjZiNppo0L7BI72cne61VSqCfIvN73Iec027AYTMr4qZAVvmsvwfkemO+SM2?=
 =?us-ascii?Q?+OUKGd37QYpyFEdwhIdH6QkFpZVaAw7za/4VItKgNd+nx/0E9DUtd1fUFN3M?=
 =?us-ascii?Q?LQOSdV9newkTVi+24D23CUdFqc3iTRmFCqLjUx8uKprT5N3bG+uDrznVLh70?=
 =?us-ascii?Q?eUpeNNzmbWM6O6CSfTow7RZ5LH3lCvnip5ve4c3S6vLVhtrx2GAQokAylUrw?=
 =?us-ascii?Q?FRVzj1kD1CbS5hOFhzaC4X1xH7lOHfpfwxfubaxXvIYkmSGxlB79oPuTXV7g?=
 =?us-ascii?Q?d1kqzX29KUyPV7bE6P7ZryBhQ25ERKsiAiXD4ipT94x78xNi5R6yAgmogvL5?=
 =?us-ascii?Q?+tKijP0SWhzjXRIblJVy6ib85IZBvta66Up4FY//chNKhl3GzymbiInp34ra?=
 =?us-ascii?Q?gvSyfkSnvJ8rCR2e91QdBwL/JHm5U9r8jhTKMsvT9OV2saUrcUSBkd0F+Yh1?=
 =?us-ascii?Q?cFIopJs9qsKdEW7lTfukU89yjhf9hHdp+nvqRfYZ96/LPddzRLzs/u/lmYTF?=
 =?us-ascii?Q?Wd+oHRrA32y020TkI1vR8PsTlUMDzwxGoZJwSaYwsQQpP1fETS2YoB/jdqzb?=
 =?us-ascii?Q?uwV+hnDUPZYFbFd3mdm1CikTjPfd437KG7Nl7R5uqCFvZ4lV48oAAuWuq1WA?=
 =?us-ascii?Q?Efpxq5n0br6s1QpA8O0IWtyEzhNi4O+qKXtAhQGp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55df6cbc-7ca4-4a80-0354-08dd9ff8bb6c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8763.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 04:08:00.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADAQaNdV8J+8GxIPQptlxazmmniBDvy5D2vZk15vo9SjO4TrSU2O8fsK0eFzO7PyP0XHrJlvaf6vtihq3u2/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
X-Proofpoint-GUID: 59nZE12V5_TTDDqGQw_B6CwXeBGN1uHc
X-Proofpoint-ORIG-GUID: 59nZE12V5_TTDDqGQw_B6CwXeBGN1uHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDAzMiBTYWx0ZWRfX50yiC+k+g7GG JkQhZGmm1425a/nsuK8YjVJNH3TD/JwFdZKNUhklLKcvLZVWKyR6NMR12lYa08vQjXbvJZbJxo1 4Zxm6AlN5rYnB7Luv9xa1Rnn6+YeUw13eQsxRJLvQeFeOHmrJgWi3vGozpsl+qsWF3BcqEUeRJm
 /uk3a9s/Zgdiyqa0Bw/phsew/nPjJMHV2pC0LNgibDFLXN+lmuhU5G8Y45kieQ2AYvIYl2yJD9Z o9nUnY/4LOXdPnWRtnPyCW4FP7bFZ5jUua4p2skSeT2Ux6Tv0D0qNaTeTVkuVfElTvWYCh260Aq kDjSwd76NYUN+KIWz0JwKfvX3HX+q7OBDcwTPi04cLKqFlqemGS87ugxhK5XlM9RvjHEYA5z2ZK
 TX2Iufb5/EQGritNGy0bhtOcZusDA5UTE7zF66zpaaL2sy4+SdPatUyuoW1IPMx3VKMw9kop
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=683a80a2 cx=c_pps a=kuLTmBVh2a3dvdeKPdY0HA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=0RPOJI5F6hdgO72ru6IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=923
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505310032

Add "fsl,ls1046a-wdt" compatible string for watchdog node, and it will
be added into fsl-imx-wdt.yaml in next patch.

Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index d1c64d97bccd..983b2f0e8797 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -687,7 +687,7 @@ lpuart5: serial@29a0000 {
 		};
 
 		wdog0: watchdog@2ad0000 {
-			compatible = "fsl,imx21-wdt";
+			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
 			reg = <0x0 0x2ad0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
-- 
2.34.1


