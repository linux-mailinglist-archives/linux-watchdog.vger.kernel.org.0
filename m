Return-Path: <linux-watchdog+bounces-3646-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750BAD10D7
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 05:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B86C3AE060
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 03:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D048186294;
	Sun,  8 Jun 2025 03:07:33 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29DD152E02;
	Sun,  8 Jun 2025 03:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352053; cv=fail; b=OsF7dMg934Tnd18wFR9hvRX01FiOsBBVqExdfgE64WeJHnftMaW5+MxvZZsagV/Ygtnk0e8LPkPDq2Rr0/6JudQ/E4ajQ8N4M9N7eUIY/Gt2xigN47IaTupOdk8j6gvXgM5tt+CjSHaevmwmtepAxyxGmorab+ZSQGmnYVFCIcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352053; c=relaxed/simple;
	bh=yo9LSrT5/cjj2c8tQEuKrvmfDX2ANjxD4QeS78EYvyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=q6S/UGmxNr92z8RZtO5+CezXPDDhkOb7VjMAnwNPJ3fjMY4wn5jIPiJ8mbDd0fa5Xy3xMOh6lfWtvZoozL/caez2FCy4P1AInJgpDLqp/ct/rF28GCxnM0YLiDQNFTN1sDlal0DMfu4CazVaxBD7Gi6/gxkkVvFzBQ6pxYel04Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5582o5D4008239;
	Sat, 7 Jun 2025 20:06:49 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq40hna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Jun 2025 20:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9uY6kKxdbKBZx6RCSjU2KsQAx513pUNbmqPQqUdcXKqG2wn5WlzGmf0O4i6KzOksfz3nM7SV88iK5pL+v2IiNDIKuq3bY1DUNpTYRYgagZzyUQBNlTiC8TAFZDPIiWTi6pR2KVt50R87Xmf6/mXuogJGdh1knKwpzNN0WLn8eEuT8f09hmMn+snL2kVZGJRcWJbhrIckMkHgtGmr1sGD4vrYI4/B3c13qOgcdrDGXXiiUXaGxcXlnmySHbhM5kP5fc9nrZB8iVYCTlTefJSPrw5AW1FRgCUWNbqvbH89z6oWBbhrVoV8Y62PnulJexoaOxto8YukWWPkt41r7mzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+K88mujTuRk0kpl9nRjsV/LmAdEhX/KbInc1qKoBBw=;
 b=fhcKXyRjoLo2ITdlYSP2qPQcaMye8e+IxyRPcWIi+u5aY7g5QYZ5V95JYvDRE/BUeqK/9RK0/d3rMs5rCxZM3w24WtZj/W3c4/KhViHJIalnP9n+93ZzEM7lhcpzLpcwtDhvAOuoOIUF4VrC9RB1Th72WV++uGxAJ77rvMCyNY/sMSmpjmL4loDY2R3pPLY2BvwlZsqRPoWXONm3uSDY3iwpyekVCTSC+5DCgF41N01UDTT23NGB+hUvNZRTOVqSwE6R+KJ+eI9yVW19qB8h/zdTwsgTkjMPyilkKnh4Td+OdEjAOMmyHCQ0i8U+VoylARZm4IUwvms/JZkNWdhJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 03:06:45 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8813.020; Sun, 8 Jun 2025
 03:06:45 +0000
From: Meng Li <Meng.Li@windriver.com>
To: krzk+dt@kernel.org, linux@roeck-us.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
        imx@lists.linux.dev, shawnguo@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog feature
Date: Sun,  8 Jun 2025 11:06:14 +0800
Message-Id: <20250608030616.3874517-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To CH3PR11MB8773.namprd11.prod.outlook.com
 (2603:10b6:610:1cb::13)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8773:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 5855b461-35cb-44cb-514d-08dda6397fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?29LvkfntFdS4sne44NnYYBWDdk9x3h1MlUZ+xlJQbAgbS3PcnMPYUBgB1kWl?=
 =?us-ascii?Q?SIn//GNQiWylUV4FJICBkr/4emh1UdrJzufuvh8wZES1rPSF2e8xAwAaKh5i?=
 =?us-ascii?Q?dLZd6/QbyD+Vi0SM93Uj5puSaIbWNeTJlPexEZJusKZxcIHkg+5I12akM/M0?=
 =?us-ascii?Q?VH3YhfpwaqMs5U9I0RcMDFKrx2500EP+jsCq+8AqBHDVuf5tmptQ0QuDdxbk?=
 =?us-ascii?Q?leSE4l7wid6b9hwAZrXYMGPUm7zNCjWgHFq7H8Teu8zsJCi8jbSyBSgeiLTy?=
 =?us-ascii?Q?hJYhQYGGSveIEYoSuvlaQgwDUopURX2ED7mtBWBq79zYmFMlja7tvWKMB4v5?=
 =?us-ascii?Q?dhHF+RFCmInR7ZuAyzI1512i843ekvu/VCx2x8/ZT5pvqPdcUIv/1Ri3Z4FP?=
 =?us-ascii?Q?/S1I/Jcs5j5or3KICnjFp4WhdceJFejoU7PXyABmRlkyoXwWslwbH0+knVVs?=
 =?us-ascii?Q?XL/7wpHmlrNBv5rTwDhgam64MEWCnQi+BmMa/5pQ/1wd5xNkxL0EMeHUDlGo?=
 =?us-ascii?Q?GrdtdSfzSNZlGylBnNuNPIVlGEnP417xXaOp7474llBWd+2rfJtuYPkm2FDQ?=
 =?us-ascii?Q?+UQ4YK7F/Dcwo9G4nxvXn0huoIv1hISmGLq6xoEApP4qOYeG12BCrOvfEKsJ?=
 =?us-ascii?Q?N/T2VfMj93f+XMKILmGKDlHyrKLHYmoepEFyuJklQwN1M+zZPeXDWfr1X9XS?=
 =?us-ascii?Q?jpDWaZspdFiscLAM05NvAXt2sAoNqsiomjYJkLbTbMadRaziw2gkBF4RRmFV?=
 =?us-ascii?Q?qDpGIAAbyX8fE/qrQTsJrXTBJzV4CChT5LWGtFxObf98ZUtzUOHtd5FnDPZf?=
 =?us-ascii?Q?yevODBpiEFn2anm6X5tOoCFeKv4wjLrfotgezdJLCJz55TgKA2sA3MPhmMtD?=
 =?us-ascii?Q?IjmlFKe+OPAIgym5wkLs1XWAbtbsaMu52aBbDIkUwKW19qFrkyRI5aVQ+qnk?=
 =?us-ascii?Q?6Jx4H4TUvPjNzAoX4VGJ0whO/SJRD5V8ypFmTGESpuVt3Tsj8MOhDYVra2ce?=
 =?us-ascii?Q?HTOxOYtB8PxLpJAU3mHD/Ks71iNbjDjqXYfno/2UwSlIBKzvrd2BwtNDjLjn?=
 =?us-ascii?Q?OqEkKyo/DDd7l2RKxlwvhBmgQTO92Bfz8meAIRjmaMnWGiJ3YJZsp72sYN/E?=
 =?us-ascii?Q?6vW9INi6TE4yneqJS9iePK3+YasRMEOfS5UnpILCwko41wHUk2V1BbLuQ8m4?=
 =?us-ascii?Q?VLzEhR/5ozR4056v1ewi6e3anI6aWSyyvMPDVYhmi1h/goHr+k/PT95haC14?=
 =?us-ascii?Q?0s33WjfP2xIlw05fNlD2eDHX47T3DDNGtKpzzQCUd2Mpvck/yQecowCYMzHp?=
 =?us-ascii?Q?7KhYHXETZJ+BrjM20wiAGGF/l3GL98ImlrT6ns6BRH30Cd0zzNFISOiEalTU?=
 =?us-ascii?Q?3fWb+tvbTrJbeXjdtEpEseC44G2GcM+0aXtq91S2jF5qGbU4NsXVbZPyoxop?=
 =?us-ascii?Q?nSH2Z2mklRD2m3/NS6uvK5xrFj76q24IjQO0CDiX6mdJbzTm/PZKw3KXOZOi?=
 =?us-ascii?Q?K6Dyp3k9w9ZHGFU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IfUHyMbS+1cKci2SX01Mq4qRNLL/TJUIzwyN3XnE+dRD8doMQgla1U3X6//v?=
 =?us-ascii?Q?6K0GRDEJRkJYVBjznZ5MthwDJr/+tGOEdW1AAFahhlt7j1596YKcRUw9Q+r4?=
 =?us-ascii?Q?RLZ3xfz+ME9HZTXyNDni8SFeRhYqhvy8U/DXw1/L54Py/0IJDFHKf5ieEjdJ?=
 =?us-ascii?Q?Xg8tQHtLI6dMf86jexTHCjy62XPg/bhjpf+Gm9Dd7WqcYl+fN63+pC7sodot?=
 =?us-ascii?Q?u5npuMYKuBursKuVXMNdLdvoO15YkjYMw+hU1klwowh4Y3PFs6EDAlvxFP9s?=
 =?us-ascii?Q?DYMl/r8SV4nUrQVjSdwW1qYl3ygJYwzeygiCHi02byIqQwp2gjkl4f7+YIMJ?=
 =?us-ascii?Q?RwGnAHlJuxsgmC9+MipCC0K/o4PZEo95rDJZnBqzGDb6G25rFrFhoKfxFGRS?=
 =?us-ascii?Q?O7G9QUsFqPXJQCq1mW+sW8P5gV5a1LyOq7O2b5MX4WS1JdNO6bYtxJisNqNl?=
 =?us-ascii?Q?6kPKyoW02kbx+iVbjspJ14A3yJ0rR/FMF56H7FxIgK22al0hJIkt4LYU9EEL?=
 =?us-ascii?Q?IloyID5T5/SD+bo+B+CRZ2OnHxJrUJuRYPK6oJ92e1j5tc3YOk2z3whPu/a3?=
 =?us-ascii?Q?bxuxLJKiyJRWjgjibITnvr3yIGRkqTAMp+0KjUW2VYReh40Fw9+M+azNCHKJ?=
 =?us-ascii?Q?VgLh1h+GPkewACZlA/5L/wxueUNrk6mEgigucJsdby+wFjuqshBTCqTy/dbf?=
 =?us-ascii?Q?8zaDk2TynzcbIq674mObv7LKLsOFr6DAA70OiQ1gbBdJJVFHBqvqbCu5gN3N?=
 =?us-ascii?Q?1TK2m+Dmm0XjChmckmZAVTwx+ivhV3XuyKB4delBRY+YnO7KpoGSUJhoqpC0?=
 =?us-ascii?Q?6GVUS/MkReLvyGoOSvis+ijW/xMJcsKcH67+linPlwv8Kfv+0R1HSOATvp8Y?=
 =?us-ascii?Q?lqjvlCb3KrbqSVjRGgWe2jYwBaXgjPeuKqIOOHcQyRQmLyVALNRV4oUFhwDe?=
 =?us-ascii?Q?T+2AjszeOfbtgL3VHHGNW6XQo/5XX3ltc4iy2KeQSkMwGkjCmvji+9w//eKS?=
 =?us-ascii?Q?1HT+4iFdAFj6hAa5DvDyGPovq9s4f8Qi/kwgTmxgPXH4xBuF25TAwAlJEIuV?=
 =?us-ascii?Q?m1ItLzb2LD9e8HLawMxwvTmk6Od+jo/wg72mNv3vBfq7CMivmBk5xbGZyDvW?=
 =?us-ascii?Q?uq/QvZCvS6LBkWP3Ao2maFNUlSFbNC6bBtkHsfNvnhSjr6x5gds4LSijw+P9?=
 =?us-ascii?Q?N4g70/IuqTmK3ym57UtgEgDRZBbYpGB1OH2ZlguBH7Vxs66GSwR50bnJxkRx?=
 =?us-ascii?Q?+jBllqUXEjvn5wHcq6ud0EVExw9EV2js2j148tDvl9fQqjZRJy7q83u0cpiB?=
 =?us-ascii?Q?354LduLCZI2QaPoZ4e3gkc0PskiZYUE74qIQx9muQ/DkRGfwShgk13PC5Gvq?=
 =?us-ascii?Q?FMepDE8GWc0RXKh7tRw2KYiMS+imiyfG4VESsVyRvBQ4/nsjdOduM/xMVKUd?=
 =?us-ascii?Q?M31vS1zBDROz0Cwb5P4UMgvkPbQHO9qGXeBbn6efrgu7rCT6o0sDQkntU3R0?=
 =?us-ascii?Q?Lr9Tu73EpAwAKoi5u67Dcn5pifQi+zXf9S/tO0Rc2FyVVuyHTVC7SHGRLwuY?=
 =?us-ascii?Q?k1N/YRr6HGZ21jP5NIERmd7LVyifWLWHcHotr4sh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5855b461-35cb-44cb-514d-08dda6397fc2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 03:06:45.0053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP/Kq1DeH3UoCu4zsklFm8mA4EYYAlKuQgUIg2e8b89/vWvd7ShL7fXCtk55DzH/OAOxs2+FWsF0G3EuMrECVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6844fe48 cx=c_pps a=jY3SVLPFeUttfGeyR2Uc8g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=QlqWAYDYS6yd2VLhT_cA:9
X-Proofpoint-GUID: 8Z3SHMTCMtvQw643zDXokCWUuDzF79QF
X-Proofpoint-ORIG-GUID: 8Z3SHMTCMtvQw643zDXokCWUuDzF79QF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDAyMSBTYWx0ZWRfXxG76qUTUfROc J9scib6+eGKEkmApN9YY+AHTsrvEWnud+DD7EgPj0JbIyUtcvms0WKKp2tnJUk5OQcqrVCjSpDN mnLreeHExxzp3pRRHDNWxI3Kx64Ww3iyfjGDyKk7MoC/FEklWGjqmN+QmiSSVt4meYiocJ+VxO0
 FDdOcF1ryosdzUNJDc0A6XPmlzeVU4naZWm0GufU5ujSByMxpcB50abBUBZKE7TP+71GkI1nYFt CwcTsdaGrcga3mBHzoEk6vZQUUTbxhucds3KQ6inza7XVjJdlsyKYRwbFToxv6ifh4KD/bown+1 dnycLaYnUCSR/QBJkWx8AvnvctN3kgXolhr6lwd/PKRz/EYufX89/f0lCAcunhtHIUj5jIL9mBP
 zECcplV6X9o1J8VpeZfkz9F9L1w5XJkd1Va9jGi//jYTqDd/tIjXsbosHfUGNtZOaLDa/Pk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=727
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506080021

v4:
 - Improve commit log of patch0002

v3:
 - merge patch 0002 into patch 0001
 - improve the commit log of patches

v2:
 - improve the commit log of patch 0001
 - add another 2 patches to fix below warning
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000(fsl,imx21-wdt): big-endian: False schema does not allow True

v1:
 - create patch 0001-arch-arm64-dts-add-big-endian-property-back-into-wat.patch

Meng Li (2):
  dt-bindings: watchdog: fsl-imx-wdt: add compatible string
    fsl,ls1046a-wdt
  arch: arm64: dts: add big-endian property back into watchdog node

 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi              | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1


