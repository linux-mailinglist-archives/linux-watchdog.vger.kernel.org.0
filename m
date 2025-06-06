Return-Path: <linux-watchdog+bounces-3641-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA94ACFAD8
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 03:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013F3188E14D
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 01:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B1D18C01D;
	Fri,  6 Jun 2025 01:47:39 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734A81CFBA;
	Fri,  6 Jun 2025 01:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749174459; cv=fail; b=bLSX0gd0etSydcg5t9cKuExdUUpdr+3wbjrWCgvWf0jXt6CNIigIS2ZGY+jUtfv47e/9V7l2OpS+AUIVqrgf1UVeaAaz2bs6uIwEZHIAiItQgjqI1zfjKVjaVdBb/iT7xkcfFx6UGwefTHd8/cMdsMidSe6gD2uFwyHbNQ1tXYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749174459; c=relaxed/simple;
	bh=hbJYxoQHXr44pDzBHU4GaMU7G5uhpLdYBqqQlscNvI4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fYJLbG4o3A2nsYlZ23vc3zr85Bi49ABk0iBEn4hewJbaEwbr1neGCYnjgBIuD0hYjv/JP8UO/NTtCJzbhn5fV5lgTXBwyXZh4IYWUDxvLdItTjMgWIeEpkSLnzvL0xxounlp/d7/NhDahbKxN2w8PpQXyNW7Ti/rT/pjI9VC93Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5561kxCG031316;
	Fri, 6 Jun 2025 01:46:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q4rv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 01:46:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aji+Uol9okCsmhhoEaxLhpEUUqA3wAd+9bO72N0/0eaVAt3bn2tshyNQusbnrcSACMxBVOirc6zAEm1hWetvvFYlsWqCM2rxsz2AIzGEusQ0hs0B/XDHqd5WEe74LsIhE14hZkrL6sLJ9kncwUlwWcIwYPLfPX3Pt1cUsvgF3kq2r++veD9Upy+smVuMdM+Edg9XxSXgAh9bV6wV4nRomev6u1/Z7zJzemmG6rpavgrNzD2ATLTYJ/5nmT8+GgSkFKtWPVziBWMOlDA+pBSmBxOSmB/l1jGlnPu2RO08eyC/xcrBnESZpGmHtCcUqU8ecyaoVIzG+ffQ0lEWHed3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6MpB2ufIg13d6Itm1WrD4eoNs1cW2F5fmqLltJl/iY=;
 b=CtCjhM7V1TFwus1KXmslcAOq3Ioz8tVd1foNnaQ2qQ98+IL6Hkzt23eIBC0FVskDLvRn6p0eiby0VGS26c6Tev8rlpWRVLj2uAc34IWVq8mimmShFFphrqObwx2qB6Ryle3IssZa1DfSQCKPI5aSf123TG4dzCzX3Quc9limFnvbyvdUHRIbjuDGkrLlZBESyfbmTG+d4tRUxcl5MI3mIiJj2MXlDo6DoKkFwohMyLuukMKUHfKhyycuzza2Jcfoz5SP4o1h+M0onfBKwmpdHe/5wYOwDSelKWTUhrL2wiYpnkbdcJKJgsgejhwVjHtQzyQg1/89+4dmHHactbG/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by IA1PR11MB6345.namprd11.prod.outlook.com (2603:10b6:208:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 01:46:56 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 01:46:56 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
        "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Frank.Li@nxp.com"
	<Frank.Li@nxp.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
 feature
Thread-Topic: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
 feature
Thread-Index: AQHb1QLI5R/2ibUE5EeNzvAcdCsKlrP1X0Ng
Date: Fri, 6 Jun 2025 01:46:56 +0000
Message-ID:
 <CH3PR11MB8773488D4C9E9C7A9D44DBF9F16EA@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
In-Reply-To: <20250604034246.3234837-1-Meng.Li@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|IA1PR11MB6345:EE_
x-ms-office365-filtering-correlation-id: ebf558e9-3a68-45e4-2bdc-08dda49c0516
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AotjYWhSgvXJy7oxYots93hCyRoOofHcdR+SXQ7iDzpov4ezzUQsHXMEC9Oz?=
 =?us-ascii?Q?jC5G5IIEinxOjCDxDVNtJdbeloDTffEM1OGlKLpu5++v2Fjv3wE44Y62cev/?=
 =?us-ascii?Q?UMLS14VKi4iDpZtsp+phVk6dJGIR4HXiu2EgTo/3Fg1YBObiSata7X+BoXGu?=
 =?us-ascii?Q?MD5wV+flVhLJjC+U6roNRc9nGYeNbU6c2HTPbw0yYeI/WM296vfKCtN1wBYF?=
 =?us-ascii?Q?Be3CQJJgTLSXWdZopOB9vcxEX7Y2nixj9K0vjdxsncPhS8FV3GJZTqC/empC?=
 =?us-ascii?Q?c3yVyhMZUxV3jqnYBVGWocpWhi0fXYU92quGygmtm/lsEgW0fCQaKENYVejl?=
 =?us-ascii?Q?Yq/Kk/R9b0b5RCyBF45Amjjho6bZ6uCJuz6iaug+WXlyqJI93SXTHT0RdXwl?=
 =?us-ascii?Q?rxWe2GvEqV67dCg2b4jSuxwrtnuv/ObMWBc9l6QUbgq4EkiuFKacpZvrCkWI?=
 =?us-ascii?Q?Dg/hWKFXv0sIF88jkLjiI0y2qbfb+L0lR/sewIsTQFbWg86zV8tjRAKg0HRN?=
 =?us-ascii?Q?MBGapAHBg4pb60Cqomj5C2n2mgwRmvFkO8l3DShobviEd9+l4ui8oxUdGPFV?=
 =?us-ascii?Q?vzIy/X8r/SDrAA2/IRxavKkkCNoSQQ0nzcYnTvhXourtdynTZJZW+raBduk5?=
 =?us-ascii?Q?Tn75WksfXSusKasoAIr3QVGC+k4ty5ZACEGhNArBxpCj4rnzFnQaCH+vsyPt?=
 =?us-ascii?Q?ppQBKVFED2y2/nBSpK+Y/g08IjSL3sR+ozm/X+zscjaPAyihB0Wc8hgq/evh?=
 =?us-ascii?Q?Od5jy0Z1Igd9h4V/D3S2qciXO9n/Ik3Q4iXnAHM97zZQptx88SzhD+6NIUO+?=
 =?us-ascii?Q?6pvhX3WMslcnASg7HAN9H6/bN+lkI6j0KDFlN6EL4FR9JyyahdKuUORfi+iP?=
 =?us-ascii?Q?dsWjBEepg0WKfbw0RHHnhejPWYQ/PerApiND3/mifGZTmx2XNVkjjj/C6E4D?=
 =?us-ascii?Q?mkTd+K4WWURf5o01TjZqbxz6xBMMSJUblhSlYkoOmD9uP6jk2R0pg7VvA0tn?=
 =?us-ascii?Q?jCuYurn54VXVFZjRWdy4jMtjgGn1wKmgeOPd7CBeo9HW/DxbwUAn83ttNPTZ?=
 =?us-ascii?Q?NEtP+sSBxyPQnFCkUav1SWXiYSqmXFWH5xhAlpCe9vhtrLOdpR9wH1R6RYZM?=
 =?us-ascii?Q?WNEymsyVfAhhcVz0i6+zYwYUfc71oomdUux/EWQ4f5k/t9X00bhQWJsL5Goe?=
 =?us-ascii?Q?zmDgENvXN/IIlxe22uWGdZ7kO1hXMF/oklFnJzuSC2YT6DncbS1hmXdzT6Kd?=
 =?us-ascii?Q?MNsfatdU/AkxujRIUd6q2T3Vu3EKdyY5IdI43q5Dn/m1Gr9Q4gMTqCCD0fjg?=
 =?us-ascii?Q?nJZcoiN0XJ295UBcem/EdK1qCoGS/yuQ8u/rrfRTQttwVkJ9im0MUidvl6Fe?=
 =?us-ascii?Q?f0qb1up+AtQZXmCwhl4JH+26AKQETYKGDDAwuVe73gxKHzuBDiM0F+arn1Eh?=
 =?us-ascii?Q?wd8/g+yn1zR6G+X5nP4T5BmDmjuZY0oSp2gncZED0k4ATBgFFwZXfM73xctt?=
 =?us-ascii?Q?2lvZk+f+xdPNsTM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EKnZL0PsopnGAqCZo5WTqJ7mbhg6/oZcU4ZVbSkQqWU1YMLGuXJ2o8hl0+C+?=
 =?us-ascii?Q?OarNOaq38mFYwUP80w0vtU3gG48/KiHC7i5VPH++pQ2ezKj25vt1thwpi4Qm?=
 =?us-ascii?Q?9FOxBilc93D+mVMsBCl1+riSEpoOfG1G5NghlmZ0iRre5GyfyD48JXeWtnBk?=
 =?us-ascii?Q?w6NXbGPRRnpY1Ip14XVG3imSR9EjLyySRr9sM1bEnKL9MUj8+v21aiBoPMxt?=
 =?us-ascii?Q?3QKr1YwlNNhGNdFM/EfYjkLuwR6bjP6UQr3YZR5H2h4nZCwAL74l6GTA67MQ?=
 =?us-ascii?Q?NMKBnPqIKjEnUmYOGzM2YB+mfh0OQnBGPY1WB4/t1EMGu0aoFPQWrJJnZVae?=
 =?us-ascii?Q?S2b92NR62Y9eJxMOai55b4YU73X6/COHWClf8hl8rtRs8XTea2nt3N9laE5J?=
 =?us-ascii?Q?yOxdOYCGu84F/csb2QYeXQq2xy7a0jz3sOanh3Va+q/qSQjb1IlleTAE1L6Z?=
 =?us-ascii?Q?Dtkib+Gh8aAfXxRd6P7QCjNDgiwOXwtiCk+fYtBSGFavoOBuRVBOjWh4gVyl?=
 =?us-ascii?Q?OpGRkhSPX4Wcw5hkPmKmA9wm66aNUT5dNlz5zBBvEqlHLxrbHvOUYISuipSz?=
 =?us-ascii?Q?n3PuadraEEXR+NwKtl++NcMfgFKcLkd8ST66D88wlyiAhOeIzJdNxxJj6ojb?=
 =?us-ascii?Q?rLerfUFl9qH7gCOwTlpF+o07Pd5bVt3HFlqeszrJjrSjUhizCweQ/QSZucM2?=
 =?us-ascii?Q?cmbveOzgSjOs/P94ithOmF8Sm4bNNeVOUHnkDDJoUQSCx1KZ25pncAzkiSTN?=
 =?us-ascii?Q?CrjtOjdwvFfrMVZO6EAJ3x3sLyjjLryguvnRP2GVJh6AbTJV4AOgFQ3tN75Y?=
 =?us-ascii?Q?mQ+FgUjMftHVFDI4clp4/IA3QqtmQ4ZJYGkDNbkOvn5IBXNIZ6U7AG/XLlNq?=
 =?us-ascii?Q?UUbN1LKPaHrc3iVZT4MGaqXyJH5Rs5UcJrQBDe5ow0G4wW5Jqrl9S7lvOuRx?=
 =?us-ascii?Q?A/VlVlqP/TxRqTotVejK+s2V7pXEqq2enY9phFfZe30eW66PzKq+YkCOTLjy?=
 =?us-ascii?Q?EqiFAy0O3KXeCh2Uj7wAF8qrWCXMAyVXolE0vVUaRwsbWb3czS5uSGS0eJUs?=
 =?us-ascii?Q?HJwLreTrOKqxgMu4A8i450Eu9HB+3C0n7cVD6kpQPEoZ503xwDj1HCLcZoLB?=
 =?us-ascii?Q?rvPjPYhybPJV6Df7b1ttDE00zleAPRNkV218GVRrxPZklqtiN7Lr4xJwU3PE?=
 =?us-ascii?Q?Ilt3KTzeXvPF6juFUFkPV4qfpB51GSkz66d9vvfkLRZSKwqUfEAUsz8vKjdH?=
 =?us-ascii?Q?6K1tjDdpJPV+FYgT/LKR9LARjKGAkXsvty+5Idq9X2dg0s1seeverkwB6ECb?=
 =?us-ascii?Q?3Hh1ow1A+dgPQCV4XCmA/mavslQDxl+/1VbK0NBfjXINmZsz+FlK/DG59EeB?=
 =?us-ascii?Q?Pgu8jhMDTeOTpRhxveUCOWrADLi8BPfOmkWqHe+sPXkpGvS19pqFiON4QjDq?=
 =?us-ascii?Q?bU6MMX2mykHmO0EKQxwfXzSPCQUyAt8RC6qahsWWHyAIyaUBgPknLLxLmVf8?=
 =?us-ascii?Q?MRc2AdbNVRfIb6CBsnRgSpfViv4/RmI1RlvQ63BCzmmt6hg9+C9gEXZJnNeI?=
 =?us-ascii?Q?x7+es9DmWLMif/idSlWscmZ6FL+TDqzBBmkFlaQ5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf558e9-3a68-45e4-2bdc-08dda49c0516
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 01:46:56.3110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ue4JmtSg+VEX90FaA3psXVKIBr0zFC2eKeZN+fPadalaTbMYIvWRspYCll9VpIFe2JrFPj1lvyJEQ3/OlqLLEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6345
X-Proofpoint-GUID: BYN13t7W0SmDFOKkCA4nPa6bXNmAxVQh
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=68424892 cx=c_pps a=YqU5DhmqHHlC280H9UYkew==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=JfrnYn6hAAAA:8 a=bmcFerI9sT0AXqtmbQoA:9 a=CjuIK1q_8ugA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=nlm17XC03S6CtCLSeiRr:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAxNiBTYWx0ZWRfX9Tw9ra4TycYX mitUbu6R3tUBNoLrkBPcOAHu3lYk8G+HT8HLSwtCt3yI6y1mQQcTbOU5vrd8gU7L64tVfRgunWt wjQ7jVb6rtGXgs+ejpd3aaaaINLvMPp8yI3TqXMSy5eKGSdUGsxFlyTfpq8jqxIdWqPqoGlpkeK
 m0Iy4VdEetdU2NGxig9QUzZgAi/nK9grId2F0uq+DMPl73H+WTCRbAQcGjb6+U37AxYB1xfAPYi IiQA2z6tWYfGjQ/7tOnrLoJCngaSqkC+5K/5o8qzWZsc748i4livqlr7GSltZVvVQwPpa4bBLcL qp3pIuUajGC/B/3qGRSpdXBgq5HLwZOsApipz2uJC/pGKl41taHrWvfcoaMBs7JGIQ0Ln81lwWi
 gbdONA+A3pJX7nbYnsyYCQdg8sZjqSD23PZHZyRuRGG4oF4mj5ajqW8bOcVJ4TmqTOIURa/t
X-Proofpoint-ORIG-GUID: BYN13t7W0SmDFOKkCA4nPa6bXNmAxVQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 mlxlogscore=847 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060016

Add watchdog binding maintainer for the patch-0001.

Thanks,
Limeng

> -----Original Message-----
> From: Li, Meng <Meng.Li@windriver.com>
> Sent: Wednesday, June 4, 2025 11:43 AM
> To: linux@roeck-us.net; s.hauer@pengutronix.de; kernel@pengutronix.de;
> linux-watchdog@vger.kernel.org; imx@lists.linux.dev; shawnguo@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; lin=
ux-
> kernel@vger.kernel.org; Li, Meng <Meng.Li@windriver.com>
> Subject: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
> feature
>=20
> v4:
>  - Improve commit log of patch0002
>=20
> v3:
>  - merge patch 0002 into patch 0001
>  - improve the commit log of patches
>=20
> v2:
>  - improve the commit log of patch 0001
>  - add another 2 patches to fix below warning
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb:
> watchdog@2ad0000(fsl,imx21-wdt): big-endian: False schema does not allow
> True
>=20
> v1:
>  - create patch 0001-arch-arm64-dts-add-big-endian-property-back-into-
> wat.patch
>=20
> Meng Li (2):
>   dt-bindings: watchdog: fsl-imx-wdt: add compatible string
>     fsl,ls1046a-wdt
>   arch: arm64: dts: add big-endian property back into watchdog node
>=20
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi              | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> --
> 2.34.1


