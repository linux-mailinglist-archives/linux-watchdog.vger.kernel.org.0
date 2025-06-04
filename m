Return-Path: <linux-watchdog+bounces-3613-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82841ACD6AB
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 05:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91A7E3A7501
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 03:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9F823AE87;
	Wed,  4 Jun 2025 03:43:59 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F423A9BD;
	Wed,  4 Jun 2025 03:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749008639; cv=fail; b=iEU0uHTvtLyC/lB8xZ4g6ILRRUYaXQrGelUf+/bepxm7KzUXza/iYJd808J4F5QpF/1l4xPBWlbEx6eFdn3lQ/egJBdUnWs26mOX7LzBMddQcCdwr5jdACsrwN9LL+z+8/gRcT15AjGmb3o/Z8FWPencaHG85DjtncngmYriqiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749008639; c=relaxed/simple;
	bh=S7aM4OoHDPhw9kDuYMBIDDYf9zT3ImvTK8uzoUzgmdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aCT0LLwbt8v2xeKyFYvwhxi840KVXj/w0JFh4dNlRbeuKlILz947zjeKcH+6l/T2p97Xo5x8Yj1RLAjdzAHcaDDZEYFT95FMSqFCC/rmsqbLPbBH1VOjDT+gBlggQCtiqyJLtfFdioArAqK60uSkYED7u3w8pOxEQUI+M+MhT1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5542DmbA031274;
	Wed, 4 Jun 2025 03:43:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t1w1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 03:43:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm2+kBGZA9ZJwKhcLkE4J0gAFifuGsK8Pzknn1xqfOwcKojUvEp+Sx8kLMRMAGMloFQIro48cVIJZxt0OeiMHYbpnz2ecjVXGDJ/bLkgHpY5kbM7uJwEZfTzdnFXAogR2j3+mNXAovi3qUW8yUpmkUvI9TvhwYjDsmOwzIeWOKvwj/y9hu7iy4Dx47F4q+pIjgkF53eXShtb/Lpmln4N4oUc2PyucWAiQW41zHwf4t2fIsycjvjqT9CVomPF6uufu2hMqVAHIiWHCqsLxcPAO394+hUT1Jl9EYVzLdym3oigUjAiq1vP21Sp0LjFpyCnhTpftJyf0Y2tVU3RtuuvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UofLa+nxjS/n8/AQ1hc8UOYntVw2z+dR5ZERE2/H8xY=;
 b=LJNC6ssezOsCqN+MmJi1nZjncJw84l0303Z8dySzQ2bjV8cvv6IcPPtyd9krUjV3odGim+5w7UTP5ZygCjkeNuQh5oB+RVoJE9Ux1iVNvPBN4ogj5iJdkjxBVZ2kESqqtptB8vnM+X4mkmZdtjJnJ1yDbrLZxPA3VW67XK+BRSBs6Aj8u06RQTX1xz+N0cYd+/PZY2Z9LGBmws2lS94OOYw32xyOZxRtOo8vlZtPurr3+KCDsMI5e2ZkxsAI/yswxklfC0LeCDpVyEILEE/3utbCq88h2N08tAb/O1Ki+sF1H9Ghgg2FSEp4nVbo2s/kz3YBuT7qDjUMqvAtkMqgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 03:43:17 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 03:43:17 +0000
From: Meng Li <Meng.Li@windriver.com>
To: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
        shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v4 PATCH 2/2] arch: arm64: dts: add big-endian property back into watchdog node
Date: Wed,  4 Jun 2025 11:42:46 +0800
Message-Id: <20250604034246.3234837-3-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604034246.3234837-1-Meng.Li@windriver.com>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0033.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::20)
 To CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8773:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: 150801d9-7d0d-4769-c296-08dda319f0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/jzvZdu7JMv/ai/ce0Oslq8bjbu8SPMoyeB+jjwm6oE8IOYJC/cd7+XK5gnL?=
 =?us-ascii?Q?4JtkrVskJzscFZdBeATogYKBZMz3jKaas53c8kz3Yf4CkcSDGo47yWVqZG3e?=
 =?us-ascii?Q?1U8f8OdWMwLkdVOrZHUbV2iYsP66o8//JSRm5tA0awh66cUMEQQsb9dwt7Cs?=
 =?us-ascii?Q?3E2CqRAMbnGWOYoMxrmEEGD+3JHs5z6GlzCvdphBYIujzYIMISVCBpaNryFp?=
 =?us-ascii?Q?l566aT6WHCZOhBmmIpOW+hc3XQZP6vUURjtd9ySN7Rt5k7Dom6PI++NfZw7V?=
 =?us-ascii?Q?kMdPOBT5IazBIYQP/lnpx/WVixj1CwbKECNXL5XXlEVacoOqRYAwRZlAyK0Z?=
 =?us-ascii?Q?ISgUQckde+kWgCGJE4aiJBG+IKTWJ3dDw6P+N5VxmdzWA2yQUTBfPnpffW/E?=
 =?us-ascii?Q?BpgJs3R60sTWUz6wAq2bzDgoaCGllyewBi3QuhqVZxcFOYty6hDH7WeqTfOf?=
 =?us-ascii?Q?JUqO9LltGkExed+g0M8cLIs9/hjLmY1byx8+W+9rkYcIHnenr1vFvY8vYSp5?=
 =?us-ascii?Q?tkTMSqxZAf651rWDCy/ipWmheAyRaLCmiHwL/tmSnv+veUZxySSFPMhuViGX?=
 =?us-ascii?Q?Wc8MAJQwgoCP4EoIKj/hUva6Hvr68izT4Wt8uaOO/iDe/ZFq7YiTBFRjS/Oq?=
 =?us-ascii?Q?vcJoSuyJdm4E2IwuGnqk9AOX9w82z41DwBJPE60IkEnCAPcYV+MTq5h8EeLE?=
 =?us-ascii?Q?s1q3TiDhWx7x6JV5/0TcF7vK/DpTjLpnHUy8e32LledQ+ts+zc4l+qJDxZY3?=
 =?us-ascii?Q?X/YFw1F515coPj2rekGUhcOecwkYO5FHW6H3f+jAbxNCTc/Hpf6wlliB3P6G?=
 =?us-ascii?Q?7n6Rqe7Pi1+xRaj0Z5ODCk4UIUJLq4j8nnLrh/7npDRB/i2sAN0LTE1dKxA/?=
 =?us-ascii?Q?Xzw/tHgq6BdpPtXzts5cI91pFLxZ+Vw2XgIcjOkt/HvJQR5RE6CgtO/Ki42f?=
 =?us-ascii?Q?nPEnEdJoqXb+nDIvfU3ncOwBzeJFnlin590n6FIPx3nkjHPQy8/Trm5kd3Dd?=
 =?us-ascii?Q?1iaPefls2k9NxFs2Iol8pnopuPniC5BOPLbN0qgEAofAVHrFqQVzx+56WY2H?=
 =?us-ascii?Q?km+dw6KbYFCvUk48sdWJdDCFq2NuNFVL3ocxSRtoNpPVPXFiWCGFFlGZA6Ue?=
 =?us-ascii?Q?lupVc5lO/WdL3WEgok7JITL9SjhPDOnSQ8HerLjUwpYgr59ioGesntjtfgLk?=
 =?us-ascii?Q?Bkxo63cSg0wdfC6abWwFxBvlQzrxuVOR8UnAt3WGGxQojmNCwD1iBao3j9jS?=
 =?us-ascii?Q?fZ5hBRvsf3PQUT0r9MecdeCSbQZVhnQHPlKhVy39MvaT/8LbzMP1rTEJXGm9?=
 =?us-ascii?Q?p6qXd4NT410tqiyvplEw4edS+DWRINvklt1SpLuRGe8X8Cp4aPF/JFjtA+lR?=
 =?us-ascii?Q?1WgNQm13HJmnur7ZZ1sLgZBYEFNjCsbbf3iPQMbqvvlBZayQNAif2f7Ps2SJ?=
 =?us-ascii?Q?7HrBWwuAxqfeCMyh47MCCibtUqnzXMBeh1xiq9K3l7GVFHTvkViZMg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kHFbxwdk8z1p1ru1ofL6zoHTbg68fqa2GoyhTMlXpPNSobi5sBSfPnkp44u4?=
 =?us-ascii?Q?fMo0jCnjv8QxVVHHMSQNS24pyFU2aW7FhpN9s24B1OodJSZJjTWNX+8YYTBH?=
 =?us-ascii?Q?rELELm8n8KgbACes0c7Cw0+z+xfgiYvaS7k7ztH14eXcWqM8/lQCDFx4JtVR?=
 =?us-ascii?Q?+xlzoJsxshxibMwuRUqAyYQmSfbDrDDcUkgA/qCWVbw08vu6WYSgxNmMBgQ5?=
 =?us-ascii?Q?qNUwnz1o3tUAScOUxgG8eBfVeWOWrQ+yAPHummMhTHIzdolqZMW5+RVamEzQ?=
 =?us-ascii?Q?LDkZH5eg6oxQXsUeh58kg2K9bokn0+5/idvQp++y9gCsKcLeTN3s6B5TniEl?=
 =?us-ascii?Q?LkH7EaYzXtZN6gG7PmuX2NIMCJiPefh1AlcYRSnxJh27OTtOwaq/7hSYHdq5?=
 =?us-ascii?Q?o1SPFIIRzRzg5HukdpoAbwZVgSZmJP6x7sq2McyuLQItZ7Sl1soWJsU9aubV?=
 =?us-ascii?Q?BcTLVQYhztDfg8CUwHBiNlaTdhfjzfykQk2INwucyEPAYAG6W2B+4pKGeNIg?=
 =?us-ascii?Q?ZZJD13jb+IluubR5aQYGHZLq7UoYPT7heFjOW+d4cClhODKyydFxw4fgYpWz?=
 =?us-ascii?Q?z5mCJubt67aiGq4lkWjzh1i9y5VzF0Hisd9QaP+TBmkcAMJd3EUMdWtU32cc?=
 =?us-ascii?Q?a3T+v+D9deHoFxWXke1s36JBlw4UVu8iOGkZrBdr1yi3+Bim3qXZby/9gn2B?=
 =?us-ascii?Q?XEpqjdoOWIWSUORkw0TWTNR96QDvC76SHkViz1CoudQKE8wJfT7YtaqvMBQE?=
 =?us-ascii?Q?T+SNGMPKuFD4vOJz/IbOAdAR3jOF81JzyH5A2wZvChqqyaNVH7Lik4PKyg3+?=
 =?us-ascii?Q?sCKgf+Bl7U7P+oQU1XHOyMgaXSIcM3XX+G7FV2O5TMsKcnZmPAmHHUsaG/+v?=
 =?us-ascii?Q?+URXUDfMYm949JMwhhgIoEU0C7nGaTYCLHlx674Ij8ixQUbCS7HWZPRr09g8?=
 =?us-ascii?Q?+cBIiHwlgl4/09OlWIfIYUbtb3NpLxEmrdc7hYxUaWbWUCps4u3mO+/egYsY?=
 =?us-ascii?Q?TOX9xD0xLW/1Pds5IyBSO72sgecRkgxYg8qDtuivq1JAmP0OrD9tHBqykFQG?=
 =?us-ascii?Q?MDN/rurU/eU/M1urgDHJ7fX3v0aOpBQk+Npp+IJU3MDItp43C+/rkIc3OR/W?=
 =?us-ascii?Q?F3iIqkHztwLNG535CS7zjbQcZI2ipIsi1ZBmZqtonJBlmdygG8D485U8Gu+S?=
 =?us-ascii?Q?cPiBzslsS5JUXKTMnXSwzzndos6X4b99a9O+TO8qZsoBJYrhi1O9Tfgx8AVu?=
 =?us-ascii?Q?bVRi9z8RwNfdB3cC3vbtsHotdXnlxxWXzL9fTTqGBzUeVa+AphloZf5v+9HA?=
 =?us-ascii?Q?4tPTo40UC/f991IBrMMfjnx81Cj9H7TzlecDIbniIf/Ubjc9x6xSt8FVwjKi?=
 =?us-ascii?Q?NngK5BS4qXD5vUit4LvgIGc76MW/EqPoaVrS/r/VTCVi0WWUfc454NjTLJt2?=
 =?us-ascii?Q?FMITVsiLcIqAfH2HQ2p523EEqJtIIN+25/Dl3RLPJhE1R3gsKtvDJGU1Qdon?=
 =?us-ascii?Q?ofcAiJKtNiuXGj6+6dkINlmSTGwD+txXQ1Vjru0zFVyen43qF+3yNIlKzzpJ?=
 =?us-ascii?Q?UeglF3xw448nx+fOAcfITrRMdtI7dDaa9flp1X8Y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150801d9-7d0d-4769-c296-08dda319f0fa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 03:43:17.3326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RddNYBCJYNVzCfZYxqtxgPxpvtyJ60009qS9XDGFC0VKjc3U2rPZvWKBiQLFrONqaFehZQGRhCBNIJusRYa9BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
X-Proofpoint-ORIG-GUID: tRe3XbWGyjAnOjUux_dDDCXTJ3swvYWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAyOSBTYWx0ZWRfXx5UkGUEWfFgy 6Gd0VMPzcS0KbFn5kQM9Wqv/zKalJoZwJzNqZzrqiqcW9mAJZCi97rjjwct7wKjWfn0tlS4fAWC mjH+sxMfn0P4tfebcNysXgQNEYdLkZ4ETzas4yRQt1GHntfzRSYYZ72sWToThtJayCAAUW0Ls54
 4heKSCQjggduRYbTivypfAh1PBn9OOvS0xvc0FKe0VA59sVyXaN0Ns+gdxwPNm/ZfLeELD8LFUF eTY74XkG2YmJ1Dv1TvGPJf8f4U/pHBgk3rvGUtUFkNLzGl7ZIkSMVkX9FtpH0hccaVlGlAH2+Kj poQq8C2Qjh0hoxJWsXZmwg1kHIUwOpcVvGoirxqtgQAgjjowyxChGuWBNqIvT0rdcF9ogoGSimv
 a97fpGcRMDxA9TLLnAlxrhBezGZlu3jyv8EpUUUc152ifkqADBb+yt6Mt23LERuinwD+zjHG
X-Proofpoint-GUID: tRe3XbWGyjAnOjUux_dDDCXTJ3swvYWZ
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=683fc0d7 cx=c_pps a=Pyh3CA1es36lNkRVDm3xrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=N8_2f3WcjlOfNawuRIgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=914
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040029

Watchdog doesn't work on NXP ls1046ardb board because in commit
7c8ffc5555cb("arm64: dts: layerscape: remove big-endian for mmc nodes"),
it intended to remove the big-endian from mmc node, but the big-endian of
watchdog node is also removed by accident. So, add watchdog big-endian
property back.

In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
property.

Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b4400..983b2f0e8797 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
 		};
 
 		wdog0: watchdog@2ad0000 {
-			compatible = "fsl,imx21-wdt";
+			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
 			reg = <0x0 0x2ad0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
+			big-endian;
 		};
 
 		edma0: dma-controller@2c00000 {
-- 
2.34.1


