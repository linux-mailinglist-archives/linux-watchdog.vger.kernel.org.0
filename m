Return-Path: <linux-watchdog+bounces-3607-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C522ACBF0F
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 06:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80792168DD4
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 04:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0350B199385;
	Tue,  3 Jun 2025 04:03:54 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E91537A7;
	Tue,  3 Jun 2025 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748923433; cv=fail; b=OhVbFkNPRoRbyLPGa3KjjOBJoBA6RytHHiKo5BG89ORb7013D/1NZELfUOI/oMrA43rnRcnyi7YZPRn2ME4mzadk+IgQloNQwSLztG8voqdP6maSlVE8lu57RNurPtFUXLHbMrIa7/Se+rxLHvyeCKvYjtQc6U9RGI5TxWCLeNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748923433; c=relaxed/simple;
	bh=TmHpdgB41lxSXvF9aWnTpEpmchxx7jUBYtgntsB6YME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WaVOl+ajW4PThCH4enMthkmI26y82czq0x4FADMrDHuxGj2dEFa8NnFwYnvS4cAa3vsMtNpJjkk6ElAqzDSW51MKM/wVK73KVchcgewWnAZEupOf19IOoLCM2XwzznfPqgEdPnkQRoS7V1tnXSGsf9qpXTqAcoy93q15a7wp6c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HLoTn018895;
	Mon, 2 Jun 2025 21:03:11 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrffx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 21:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1Bfb21WjadJXdkfZIiPAC/ceFAYujydwhTMNXi+mdaz/xn9KWyUEJxHhIlczaSRKqeFe22L/aX92wqnQx0x1/fADNnbzcuVPdkUfgJbgvUHSM+eg+seBzb5SlqSr4yqzgW90Crrih34B5fEflTm5qh5gEwYUnCd14iYT2CUCHSj5CgOjNSl25ojTpjNwloDrmWawl/ePofaADN/YPv7uVwYXGOrOa9xWQZ4F3XDQeRMAf6kpOV0JsDz6VeT90eby/7w+5rm5W34vLIEdBH21lNmJiUOW+NCGwe37GOeAQE8cqimjE/oSoBvtUvh9X1mq6Kpl6JqgpaAQwoXDoSdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvd2UZqMM3qvBf1gaOLfcUffPGu141LJJApJEuiiUGI=;
 b=ewXUgOllZ/QhrftjNW1kLAQz1SLX7RFR6b7oGpmlBoPgc+BswpPtJmpnHbcZ3Q5cUFq8+G2goUy7o7WCm+XVaeBwm0olCWkQ8Mdi2ArYnS3aX9cpWIq7GZjfMEBdYztheMcJ8fSd9c6BZ/qlJTmimEdhpYDUtAQ/iaab1MbXi0IfQUXh2GLzyio3XAkszX1CCSxOSjXGYYlmCgRnAM/z23FRMtv+7E/XYVfqFYyjFLJNfpwPx/5Iq4A/E1tD3E0x2uOYtZoVYVW6cSIcozr2dTHI4Q7+HYllGeSRqQXvzWA9M4QUR3GkUs7rRTMvInuGzEu2EcBnuEj+Qgwr4IBWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 04:03:09 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 04:03:09 +0000
From: Meng Li <Meng.Li@windriver.com>
To: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
        shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v3 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add compatible string fsl,ls1046a-wdt
Date: Tue,  3 Jun 2025 12:02:29 +0800
Message-Id: <20250603040230.2012772-2-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603040230.2012772-1-Meng.Li@windriver.com>
References: <20250603040230.2012772-1-Meng.Li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS7PR01CA0249.jpnprd01.prod.outlook.com
 (2603:1096:604:24b::18) To CH3PR11MB8773.namprd11.prod.outlook.com
 (2603:10b6:610:1cb::13)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8773:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2ba98c-fce2-41f0-07a3-08dda2538d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XzHcKWrO/ZV84R+3wAeVNyZIm3p3y4ZVPHZIi8cvQXs2BZfzDpAKLHXHtue8?=
 =?us-ascii?Q?XLJFQUys3eTAvEOWKnOwC9doqg4gqE3IPhSner1cWVR+F14cQ1lHe7sCe5Ey?=
 =?us-ascii?Q?4ZD+D5wDEeXmRuKZRXVgG+KA7SL8dU0bAjQgJ7YGS4ysuD9igTEraHwO+PHk?=
 =?us-ascii?Q?4gg+Bf9U1z562ehnWD527vmlIGGYVnNwwOb/44fFEUQAJbJecP/dFgIb+3jM?=
 =?us-ascii?Q?f+8BWCoTXxHLP2oH0QBFZ+D0z2vBIdBDodVUrxWeINKPqWlIGjxW/znDHQFG?=
 =?us-ascii?Q?GKf46pWlf3ySoXDojZBt4fAhC1cR+MKfrQUPz2fmdNunVTRDlX5sDAmXFAQM?=
 =?us-ascii?Q?ZTW/NpAX0huRUD5o7Kq/dQWUdsboxq8t05ebduaRieXij0lR1/RJRgiKummt?=
 =?us-ascii?Q?QHqFJcAfdfdbjmngRZi8FQt84zb6hfpaAgFJzv9ALtqgw4MOpr/9s1I75hmb?=
 =?us-ascii?Q?ORLBtws1HeDCHIvdxYO/iplCg5W+Pgl63TN8OSKmznDSw6WTePtYmZxrgLuP?=
 =?us-ascii?Q?F8yvGpzRWy4fUD4sC/tEO9rNYiegVGzNpD8Ftf3VHLUMGkn513d+rvQUKQ6f?=
 =?us-ascii?Q?Wnp5qaf1Vc2DWbfyR9wdZ4htbM2Mm5MWtKY5tvNn2C15FX31rgwyb5c3zusr?=
 =?us-ascii?Q?2n229yLzGfckX2sl2r483Hb2XQoxBkGvawL3VqDLBP6jmpryNxdkvCg/lQVK?=
 =?us-ascii?Q?juM1BZA7drXQcy14akQKbLdKEZRpnJorDfPatHx9cuAzr9jfVGKzqtNorOgp?=
 =?us-ascii?Q?XYm509U/kb+v8WzdjrxzDOTjHPg9u9+hmpRVJQgKKxVsG4tky+aszyCL/DsV?=
 =?us-ascii?Q?S9wA4us/B0OH9AEgDy/X1KnMbdPp/3TH813qYZzpAM1Kvpfhs3pJEqKbN5ub?=
 =?us-ascii?Q?S7D0+cNtaCmeReYro21d2fauwWkMJqJrkOXwRfnFULA4dGQ0LTBafERtxhpn?=
 =?us-ascii?Q?KYRL3HRpqaYAqVBXor8krorc7XWfsJUxqpRqQws3wbO2lwmRxnzGTwLY11Yl?=
 =?us-ascii?Q?bWo+qVUFcoqjZD3AJzwxDf/BlIYLjiQ3VssfT6BNso+kUQP/kZq82uWC+UXm?=
 =?us-ascii?Q?yjNmwOn+X6uRLFZ40G2M9H8ymHD1gffa2q6Ajm2gwYD/UEf8KiN0b6/Cq/d6?=
 =?us-ascii?Q?naE9nioTCBTzIZcwHnGdBBl3JL/HNpF+WJphfcYU/MAUowqVAB+FwESLeV9w?=
 =?us-ascii?Q?40rb/MNaQYobem1eXsG+m0Zhfhtei52T5GkEIPYhglaexX3k+bhN5myh5xTN?=
 =?us-ascii?Q?HSyvppjvH80BB9x+Yfjg1sYatziblFkS9JMfSsIblGoTk6CYbld5IJdETOJz?=
 =?us-ascii?Q?ID447ow3/N20kTJ9fEPZeGqwXrKKYWxaaxJJ4zJ4nBo5lrIDFwV1ZWobttA2?=
 =?us-ascii?Q?pdhJ0s9BaLPaQFf1sVEkTK/Ro3Mh4tDu54BLxXYCXgU3hO6XvdBF89rHXpsH?=
 =?us-ascii?Q?FWiYNqMpmkYlUhAHfkP7i+yrniWwLHZJUp9Fww+15/oeqBPdE9MHcw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BiPnPjFpX4kxHwKKuNsEza/zi/Wt9Gj9HyKxzth8cJBm6sKXZxaS3Ox5C+Sl?=
 =?us-ascii?Q?UZ+Ukl2L4H77wagmQz9Sxn3Q2V7afDA15RU6WIzRBY27u2WQifnBlGM4lzss?=
 =?us-ascii?Q?27dZIS6XLjnuqRREmJWm+6BmcmZKNBKPkMDELfS+b080LKwIvXQ5moVNGPzi?=
 =?us-ascii?Q?tGesybVtYjL+N6HNTdpdlFgpn6kFBQ3hG26uXd3nPDMhW5QK6K1YcqlwlJV/?=
 =?us-ascii?Q?AZj2sp5EFKlOw/eyI+Ql7saAwyZ9g5iVw9eg8kMIa0qBszvkKLd+i+KShiqF?=
 =?us-ascii?Q?Psq5BpgNxRb2xmPdqbE/ZJCWJVPmSxnf61i+G5W/3hS0T4zTmnTRa03H9QZg?=
 =?us-ascii?Q?5f8AALq/PBLYvwlOCMVvGWun2CW7OYNjiPseVvO+FmToAv5EyF2NKyUZVhFS?=
 =?us-ascii?Q?tG/HnKPTZ8qXO4vP2c5urmpBnlIQm2G8QIfQG+PzTfLNBDkRx7NDkB+vVB0a?=
 =?us-ascii?Q?Gdb8tGgog017OKuYfec7Oghy6QkzmuQSJ1ZAlJHahtepvhRQ8QVgWLvIJkTT?=
 =?us-ascii?Q?U76n1aCaU+0/nHS3w+E2GyOeynU0govsdlI7SShUvPX0afwvW6ELMhGG0q4Y?=
 =?us-ascii?Q?qlzSuu6ibhwmZO124lk4r3rkzrmHU8HKnPLsqGlXZ2a8qpXhiMrqUzK2a8QC?=
 =?us-ascii?Q?8IjhS/AjcWM+HNoAW7fKE+Kn0BBSM4B6Rb3o1v3drGhu6tcD95Y9otO1DIAa?=
 =?us-ascii?Q?NI3SVDGQJlCTKwA+0kdn9D14yEO6HUeJJo+sfbCQ8WCwATbBVJe7BrjVfJ9C?=
 =?us-ascii?Q?KfGWdzweafx0pgEw3G2M/nWJcBy8VZwbcP8lia9oxXO0IRHzgQvrZeklu4/F?=
 =?us-ascii?Q?DzR3fb8OURDcQXKG8FkH92OO8SL1yROkrX+jILeuxYbitGz0baZLWlnuJxet?=
 =?us-ascii?Q?nM/NQIcc/qbq5O8kj0PDJKfYxOkagzACFpxcvd5sHKwUyqSb7FT6fDjR697B?=
 =?us-ascii?Q?x4EKaK/ONhjQGyNJKCjnAl5fS+W5F8sfZKlxECFrE9/haHnogGwS4sKZiOg4?=
 =?us-ascii?Q?78Go5JPP5Sq0lo4J7MgFfHkApd7Ir/59zG3OnFF1M3Ak3WeFA8VgXBtYIGoB?=
 =?us-ascii?Q?b/wGhbnQNO3lrIeMBADJ4SVVpWvT/tz3KLerCtq0ziQuYrDI031ZyUX7JUAl?=
 =?us-ascii?Q?7kkJiJoAFKnWC1+j5Ozdo8a/tIm2BRIZaDI6rmmNR1nwGlXxN2H4lu6T0b6I?=
 =?us-ascii?Q?QBmFGz0a+1b7MwtOlRqXXu0xuemfYg6PA6tpA+9p4X8+xZdWdQiRBjS/ZEdY?=
 =?us-ascii?Q?4MIuleIiNT+W7wrtpdLvBNpinKx5GsDfbPzM70xAAvgjbKA12+MuZjMMCQ8Q?=
 =?us-ascii?Q?Z/yLtHHN3b6rezwGXI+5pwlgL+cfTc0Zf6NK+YXDvC7n1nCaHBuvyiVurqTO?=
 =?us-ascii?Q?cdLLbbrvII/AqGtqlh0VNXTenokRPDJ7qN6/urAw0YJAbtQmAxFhOrIvyJzb?=
 =?us-ascii?Q?0Lj+IfnGThKRYw+IdvO3Eq2oOzhIVanuUBuwts6QcrOrCSqkQrGHlVY577E/?=
 =?us-ascii?Q?saZk9+VZs2KsZuA633JoK8VEnKdKfFg5zoULn7A3NEkD/0RA5hXfvCmFqRLK?=
 =?us-ascii?Q?uWKlG0IeDvlS9rXnzEUJnmO9j0/8kpthQx8YlsaK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2ba98c-fce2-41f0-07a3-08dda2538d64
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:03:09.8321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwItewd81p64q+2R+qX5UedH60AjxiMNq84KFdX9CP/bE9ex1d/nviZ9GCgoxFcOpFCQbekGLM2kCDm5T1r+4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
X-Proofpoint-GUID: J07UaMg2DF4c616ZG5YVypormWrNYqE8
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=683e73ff cx=c_pps a=GLgEQwR1M/kyma9mimBZ1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=URNpuo5YYlQxU1XLGkUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAzMyBTYWx0ZWRfXzhBxLa7QYwnk OwIykAQCS0Gfbo7mCaGQ/5cGARXtIWgxz4Pxj53lQQmgsqy5RM6lFQx45Ync3ytV9lqANWiF0nF kvUklGhnM00upN4u4qVbxH4pu/5J/1875IwjxWz9XBwR5dqrRMuRS5OTZ72020Nef+vyNewvZ6F
 4LFJYTzOC0TI1J72cCaE3Dgzzc3ii4OMWmxjJ29RNW/cT7mru3lvTeYnUj6yYp5N9POERkvHDmB UbbygcMBJ3ZniR2AE6LQde5gFc/hd0aElQ1goL7NwFAczHt6AfwYTPhg4wc299StR8fUeWcrMsE QyKCDYrRS73rYVcms2JB1jTnlQoHpby4h3Cokxp95f3MHgpZlSZY0Zgx87tWEv5YniyBaIa+qKZ
 4NUoHec1jnfseQy8xxIb76Fzrvz0GVI86cGgWSKr96f2xwjBCU7sRsTcflP1lImLIt0LZdSF
X-Proofpoint-ORIG-GUID: J07UaMg2DF4c616ZG5YVypormWrNYqE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030033

Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
allows big-endian property.

Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 8a6c3a75a547..34951783a633 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -37,6 +37,7 @@ properties:
               - fsl,ls1012a-wdt
               - fsl,ls1021a-wdt
               - fsl,ls1043a-wdt
+              - fsl,ls1046a-wdt
               - fsl,vf610-wdt
           - const: fsl,imx21-wdt
 
@@ -105,6 +106,7 @@ allOf:
                 - fsl,ls1012a-wdt
                 - fsl,ls1021a-wdt
                 - fsl,ls1043a-wdt
+                - fsl,ls1046a-wdt
     then:
       properties:
         big-endian: false
-- 
2.34.1


