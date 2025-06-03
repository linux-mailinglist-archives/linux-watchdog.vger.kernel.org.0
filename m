Return-Path: <linux-watchdog+bounces-3606-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB4ACBF0E
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 06:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA9027A1C9D
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 04:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA49019007D;
	Tue,  3 Jun 2025 04:03:53 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830878C91;
	Tue,  3 Jun 2025 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748923433; cv=fail; b=UplTCjtU3MkyGZ6jX9BXY38fhVly5WFcPPXt5sPBbz7YqG7fSkw1ubOEbrSHjKaZeSbPRRROjL39A/8OdDB6k1GcWnQprts6mBDhmGlt4FHJhqhOf6bGM+xSP1Vxuvgix4AjR8y9xgGtN0ZijA0RvR/f8drWWC0a21es85zRg0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748923433; c=relaxed/simple;
	bh=RApzIdS5m1uHT0+BzcknjvRos9bbfNe9L3DZXP0gdCA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BQ5DhEr+HYd4VqnQyUtYV2mL2GNeWg5EF9Gas6ekKiewEI8IcmIFiKJ2kdYqqWqpkOFSiVHC+tK0Gee5u+m2R+G8ROIRYyxH47zJMDTcbLVTDesKPdLSuWdNvJ/Fe92BARtH1yo/MJgCA8UqwvG27C6AKVmB5Peyq2CzwGgbDjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5533nEX5019597;
	Mon, 2 Jun 2025 21:03:09 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrg1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 21:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FunbHAIXOyhto2QUERAxVQGimsEOvH9NfZNl5fRVVvgATdbgRrqHgeXc4VMsQL1KrVNcqzJ0FGGZRW4hndziZLbMxN2JjvTOcVjRyx7JgRE9R3glWvCU5g1mRsI1SFH9RBwC4BC2qIHAy9jqRQjt4IhKbyGx0Kue27paQyAD2mnU3JoSbfwKpWSk5LGQoOgdO+cssBlW4w/1hyEqYIwhzZ97AXOwbHdMmKFMj2JjfRRYV1D6eHiUgx+08jYlASZPQSZqPKnTLi4+i6+Ty/lnem82NIDZ822p43CfrlaTdWk7I/tk/a8tThno8c36cKQJ6YlJLL6pSUYNg++lUjMhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23gqFa0Hgnrb0JVH+5JMd0NNDoeDhQR9JY6a7T/i4v8=;
 b=iaEWiJ63fW3MXSs730RCmOWXdgvMcZjuLlmfW5uX12ndaZ9oQY3pFcsSB8q3ijLKqmc8mORl07EpDOfZIv+i1zAWeS2c0skjaM7hsWf0tqwpQyGfIf/Nffiiib+3CNVXwUBlLawCv5l/thi1LjzkT9eipRwfA6CeYivFJbQhIuKPUuZYR9rqcHI8EDfzfTtKx52lOa6b/oZ0JsaertMDgtWxyQG77G/EVfibSa1/H5taJgokvgGydwJCYvtqBkvSFV+HfHyGrvEUe/KCbaNiugmjLCaE9ksNODql/IPvn81eBeJ+1m5xJe/gyryn6+iP5Wl50dlnsFm1Q+qbmZYjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 04:03:06 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 04:03:05 +0000
From: Meng Li <Meng.Li@windriver.com>
To: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
        shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [v3 PATCH 0/2] create patches for nxp-ls1046a platform watchdog feature
Date: Tue,  3 Jun 2025 12:02:28 +0800
Message-Id: <20250603040230.2012772-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: b31642ab-16d0-49f6-975e-08dda2538ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EWqGdSveENnfiIN15udclboYRPDIUO1KbIxIWddC8frbsVQM2muZ+pvv+SYc?=
 =?us-ascii?Q?A1sADTNF7/mnBNo54RrMoUzjfwzxG/CdfI8ku9OaM5bTlOqTjp8FYCvg3xgA?=
 =?us-ascii?Q?j5Gww6BR/fmLCLJwfBBQT6IiPbF9AoSlY/IzEW/OTM/5Qt8u3124+RyJS+88?=
 =?us-ascii?Q?ljEIDoX3eP7Nd+gheQhIK1iA1FlOy2z60V10YcPJwCzthC0hMPMdFrRcrjBT?=
 =?us-ascii?Q?QLOczfy+OGSC0QiAize1DQOJKj/Xq1ZoTD5L5smyKIgTEJVouhIzNoBH2om8?=
 =?us-ascii?Q?rrVn/Mrp8YE3N+/NV/nh17lsJW3REY14xC6uwaMc9LiTSQr7CSSSdM53VLbx?=
 =?us-ascii?Q?HJPHVMuHGJnW53ZI2mNx1dj1NgsxL63koOaGvPeofhOL8yv86TQph7/X/Nnq?=
 =?us-ascii?Q?Gm7Z+g84wdro4esZbIZMDbsjOAtzLRZ9WnnJOID+x1WByjwXjy/aWjT0kGfb?=
 =?us-ascii?Q?WUFVIccdvs8HWQeUM/fzH5LN5pQv5lDb2YZ/BFQ/Eiz7liq7jb9No+lM7nYF?=
 =?us-ascii?Q?fwoMy1v3aA0D3Il7KR4KOMB1Q/Pw4F6WS6NP/wTlLwjehmrHJx999aSDX9gI?=
 =?us-ascii?Q?7NTBhvobGy+uoZ5d3irTzOK3ifL0alFrm3cNtczB8VdzbD2Ju359XAGV/eF9?=
 =?us-ascii?Q?C45FYN9oRO3Fp3SrFe8HtFyH8b5TaYdsCD8hDPIR8n0e/W1syz6tPCUevr+u?=
 =?us-ascii?Q?Prsrm1x8hRHDGgoDdhif5i+cVphE6kTVb8aQHN4DAcXJXHmqoHfVz4qtM7W1?=
 =?us-ascii?Q?Nj/KC/PzGfp9OuXR3sKsyFPzsmADOBaTBkjVPszdZm42jjaPrUyXeNJnoCAP?=
 =?us-ascii?Q?IbBK8Xzx7clWpD3Qr4f1P1tzLnMFBO5LcayUOtd2y8u3CCAN70OhKDu67Ma6?=
 =?us-ascii?Q?kIfz7qPbaGAQMxmfGutLoWJB1yYOVH1SVSYndgMhJiTOrtm8Y8kRNFmQgUfe?=
 =?us-ascii?Q?w6+ZdK1cX88GVFzXRjTH+R07pHuQOQy97dXOnOg4JO4vj9uMt/aum/PwQORe?=
 =?us-ascii?Q?jVmoAst3JSuzBxYdTWtoccGMprATYaSUUpwpYzX280T7FwKjfCglzLWq8yKn?=
 =?us-ascii?Q?dozxQram+XECLD7SjaGbTxa45m/zoiv6qhzj2FAf0p7Vv3rTdBtKlT5BB9ZZ?=
 =?us-ascii?Q?LwpwyuKpRwGaXPayy+fFqJ9Ib9Ji4FGmPyvpN/s11QEhOY81trfFBjNanF46?=
 =?us-ascii?Q?Mh5Bk3G6ktYAC151F7ihBC10STKFtSHzCkoFiJHi4+47CtoeZ/V4BdVimNiT?=
 =?us-ascii?Q?N9AwQDNmIXE3MwTdkyQkre+Uv6B24pVzZvP0ZrAKa98rP7yuKQkjjNrwnrAw?=
 =?us-ascii?Q?R5sIvBpqOHvTIiNkb9icUyQEhZiCzX7ihBOiJOUXmQ40Vv6QfnfSWExd5k60?=
 =?us-ascii?Q?UGjklHsisR2qRaOEV/Wv5M26QTgCNIG5P2lyiNWSZ9NppRL+DsIpmtkYcDs1?=
 =?us-ascii?Q?89QMjY6XxbXIiSUBlPFnXz+0g0rp1idqaOhKBvhsogtfOTEKD8TUnw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p80cBV3Fnw3T/QyqBjpeRY7o8C2GX/NYlw3ubSeJ8t0w+q1jGeVoTN0Ays8D?=
 =?us-ascii?Q?Xic6Cb3jBmVw86MrYlcp0hzsvJh4vspYqQKCkNOojlD+r2woq4B70dQ1ninP?=
 =?us-ascii?Q?5Vlh9Rj1AUupBFXmcNp5EqPxfXITVuTmnbVsS1LLNAuarRFCF6qOjzSs3OyH?=
 =?us-ascii?Q?0SJt1OoIxHImzVXfj4n9Fi7xZ6QceezVDtZAp7bkQfNmCn+/xiyBGNf9y07L?=
 =?us-ascii?Q?1gsk+RB43Rk9ZPPwcRTo7rWCUIllGhgwwNV8rWIEOIjCu8uH41Rjn/WyRSl3?=
 =?us-ascii?Q?AkFKAWp/1esSscRoijjQb4p23HRYm6xf8WlSbDe7LtKAWvHhnzN6v1eGDWuL?=
 =?us-ascii?Q?YyTXgAm8cTLKQWINqrZFGqVo9AEU27v8W4paQ8+dRLlr+526cDLxTtR8Ge0T?=
 =?us-ascii?Q?meJAulobu8tcqJnWI7HVOatK5KxW+Q0xvRtzchf7iP5P5Q4ywheiy6f109JU?=
 =?us-ascii?Q?cdS/c8UmjdwD7Js3qbxOB9zsEmSpEKAH4ozsCFrCr89K7ByXANS55xxI0llc?=
 =?us-ascii?Q?zonUu19JdjGE44ymsmmonGH6xXiJ5EMIwVD4jBnKDXNy7I4eoHQEa+/kCn1Q?=
 =?us-ascii?Q?w2j0Ymr1ga3UaksVMDqBI3gpkFdi/PvuCX9l3VCLbblJOOqCmtnzxQcl7dLh?=
 =?us-ascii?Q?lbV4RhCY6du/GeEjcZu+vfQpFgtmlkGfhKjgz8R30ZhjBU6JGvnPtPbSCfrY?=
 =?us-ascii?Q?xx8IBpHThE9RkMXKPQmNFuts1f9LSfnbsLafMPo6fZqY/OQlO1rgVVVcKhiK?=
 =?us-ascii?Q?TqchMcDe3svPD/qhfF8r7vnSs+CmMfEdjSXe8czYKN/V0GzPZd9ZebcIKLQ8?=
 =?us-ascii?Q?PZxDb1AxNcdnLTi7osJm0pA6ABfYDml1KKDPKIaqbJVlC/ED110sBU7IBhOK?=
 =?us-ascii?Q?hHQvUBZHkbIS1dKQmyNnuGux7Tv8kDoA6V1EhLcQ6jfYrqRLiv7vLHQdjEQ2?=
 =?us-ascii?Q?/bOtjmW1p2eTZjMpsaP2+8cckR6J1v3cy10bkHRWbeZG0eX0ZBrZB2H01lOp?=
 =?us-ascii?Q?fEvse0Al951hzJELZa6GHc57b5pq0mp7t+WpVMid28iWhiunz7Q9E1qzCCHc?=
 =?us-ascii?Q?8NgVLMGypvb1EMHycBt0g1znT43PyGIf7oR3LZaTAzk9EQ8XWy108uCjBwHA?=
 =?us-ascii?Q?jSZDxlsoRXguu7pecK+evcWCiHaCBeQPePQResPefTpUH6r8og1KDn12O8eq?=
 =?us-ascii?Q?b6q9dXbvQqHVxEMcJdixQINOv8BM1f8jXSEG4kn2jfUGpXbjzFt4B+MipCtz?=
 =?us-ascii?Q?xbeWYT+8TuiNc8ktDlMxaxhoWbqas7a9I4Qr29bmP+8uhGWjxTUYiMhBPDh3?=
 =?us-ascii?Q?P1j6c9jVhV1dcQIJEBIG7dIm6/tnoKNimiyAHPdT2R8Zn0VHj6ID+P1vp39k?=
 =?us-ascii?Q?JYFrXF+35h0ov+ID5m7fNLVCh9kQE/Hv8cZOfpaJfZPh49PZyXLLwPkXTmI/?=
 =?us-ascii?Q?Vuh9CrxF9+jZDdn9wul01+S2YSn6m6XHmBj+ZQCUkXmYXS4+uXYrytq3O+TL?=
 =?us-ascii?Q?ZVKp5PqopOguaVsSDBIHckRarmQsDjmm0vA79LYKCLr+rdVH9FeIzApHQjmE?=
 =?us-ascii?Q?Mj7PmcEVrhlIZCE+iaeRD8ULkjNABpo42Eeylcc2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31642ab-16d0-49f6-975e-08dda2538ad1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:03:05.6008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvnRQOLYz5bc8zVoW2Mz1uTl2sMB1jqfajsgdoSv7btNiUGLXTUTYBq8yWOZUsANjUmzi4pWHkrxBYYRgeYspA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAzMyBTYWx0ZWRfX6chmCHmE0/gT GZbnWJMureAXUmIo8EHWZsT9T2Coth45ZNcB+p3K/kFJuFrPqhFMrKFEq2eCjJZBKBnP5yTPzMb OtuUpGXVmePvO3eWz/YTkHobbl1uUtw47jkbz5xXpzr23/xUIvEH+rgmgE0pP6JLWj33s1QVLtf
 2zk/heSN+4WBYiCaG/TZ/34hTNHTH5gCjvJWWTTO28YSycHoefuxowvg7HRZCU7WPZVGzR8XANz t742/43MA1cEw/Wz2tf3n/NgQUhF4Y+Cr57h1nkTTS6DBmAFVWSUQKmf8EfU7zMKfgTrEa+b73/ k9aSy3ZX9+hmO23ONaZYwOlUB3FP42OQDcCYvbn3vhug9tLMA812V7Pw9IfsvPx4CglqKu6r1lr
 xeRgoko2AO6Iw4usGjdkHSysRMxdoZoCWNHP603KO2p/LZLJbFAj9zXVWMhzv9t2O+7sFsxS
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683e73fc cx=c_pps a=IKKnTnttSRAw3yzzHe0h3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=s1janCx9nzz6n3eNvK8A:9
X-Proofpoint-GUID: -buoqGvvZg9Z3mfC7vkdYOCm3Tv5OmLL
X-Proofpoint-ORIG-GUID: -buoqGvvZg9Z3mfC7vkdYOCm3Tv5OmLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=701 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030033

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


