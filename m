Return-Path: <linux-watchdog+bounces-3636-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D4ACE801
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Jun 2025 03:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B51E51894EDF
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Jun 2025 01:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A691F282EE;
	Thu,  5 Jun 2025 01:49:05 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AA328EB;
	Thu,  5 Jun 2025 01:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088145; cv=fail; b=fpuuw8yLB5wzvXowbfgjbUTjW3eHQwR9r1I5e6nnmhpijh548Y/LV+Bpw41jDUB/NhSgSv/0+4fElWMj9GbomtdJFdr8ibnR+tDO24+dfVN9KAjjLI+QUaM1cpAKYGb2zauBug2SzaN0wCP+AzIxwmSvmxncaVqTyn8NhaH7ku4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088145; c=relaxed/simple;
	bh=3HDpdjrscQ8Q2OAC0pOt9oWktCgE2or/Xdr1i6ku43Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B1YKprMIE0+dA/CrAvY39ygWHYVMNjIee7aIx1XZBtdKbzDxp35bc1lntrqh0nXLs6hCKR72n8Zsskpf9y+XlIrU/cizK5SWZPwGmBxXPA+76eCz9D5hJK1roJh1yjr+h74MtXkyfTzr5jE91IijHZpp2n3BupwzopAf3PhqEiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5551S5JS018181;
	Wed, 4 Jun 2025 18:48:15 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9ruaa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 18:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8FeuQRbQ/9KORUGj3D8/Kpz9yQpaUvQlMzdE/yRhZ6Js9PcT8mJteYScRsE2SP5TZu6yQPwuIUcepfwRzgB+szZ7GYIc518M2EeweL7dUBQZmZhJIMrxozQHWeDhAeACi/YWyN2r4Ug8OkBrJyz5YreA4fq25Eiy6KnnEKFXfYMvgHNSw4a20PmVetrIg3Cd1oBZpI8Kuy4bZuolWCm+fT4yB0imkGzoQwWZc9y4AlRLRo2uSENH5Ig59kBh8mv5uIG/31J8MyE83epHvyemjNRt4VqAWqVUGCM3znoJ0Pw9dkQ5eJw+dL6suUgJcB6lIrMzrAHQW/YRDW2kYIaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlqiUZROhg+++/wP43yNPXDwtD/0LLinl16Btxat40Y=;
 b=jcRPTHkEEV4GgqKLRXFaPj98VAS7AscGFrJ5EH0k3040BqMGLa5/wY5WDFY+3WEsuRi042h34R3ZABPQOnH4MU/mO8oztm+kqXim2dSh65Jth3xSxcAJutbNt9NXo4gAm9iDogL/PYGC6AMsmiy5HWJZouscqBrn1WcjrRsCRrjSivhIeQk6MVJDti5G/3e9wXs8VE77GVPyvIjOoGmCj+pMdNq3ED9Qde+MjmlmkN+Mz7puRscnDBWflw4lfJ53NlmvKA3ym8X9bXPrLtt5etVU8GkWqsLRC34lZlL2S/4ZWvs4zrH6q8EMQUR8r9aa2bNkHMNsAoMgjiRiieOTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 01:48:11 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 01:48:10 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Peng Fan <peng.fan@oss.nxp.com>, Frank Li <Frank.li@nxp.com>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [v3 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
Thread-Topic: [v3 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
Thread-Index: AQHb1DxtI3Kt9L+Ix0WIQUVf0qnRsrPxhn2AgAJX9AD///CJsA==
Date: Thu, 5 Jun 2025 01:48:10 +0000
Message-ID:
 <CH3PR11MB8773011E4E5161BA95275060F16FA@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250603040230.2012772-1-Meng.Li@windriver.com>
 <20250603040230.2012772-3-Meng.Li@windriver.com>
 <aD8MxZUCkzRR0IWt@lizhi-Precision-Tower-5810>
 <20250605024220.GE29462@nxa18884-linux>
In-Reply-To: <20250605024220.GE29462@nxa18884-linux>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|SJ0PR11MB5006:EE_
x-ms-office365-filtering-correlation-id: 13e6cd68-d96e-4ea1-46be-08dda3d30702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sZ0L2kXfLVE2U+2aM3UX/TZNXo9vASYsiVMtPgEDgrlsLPwUhA2mj9hndty2?=
 =?us-ascii?Q?vl/GETkXPAHKsHbXiir5yZb5YySMX1fwjTAyzq/hh2oyx/wntDNjo/OVHa0X?=
 =?us-ascii?Q?tq0Z+xYf5UiPatAZ1GwW9SWncJE9YVUDcx2FUSIDpEntCNQ5fdhUS19+Jljv?=
 =?us-ascii?Q?SoDUb8Saf3zfE+Oi+RVCOaOqfm8g72YSIvAWkOO3uRhnwk3SCpi/kcPkVMBn?=
 =?us-ascii?Q?h0v6JtodKJLccArkaVh2lArMnYQRh7jWJsred6cJjJcqVFzxk6Pv3+bGtuUc?=
 =?us-ascii?Q?jNMjNXMiOIc8miS2nwgB/+YICADyNqjX13cLc7RosC2AkB/ilrjT2NNqkgiu?=
 =?us-ascii?Q?b0FZyL/F4tz3drd5uHPJMJ1zDLiEXsP04+gL9tniUJB9hBxuDryPDFoKMS2i?=
 =?us-ascii?Q?FiU0+rhZKoDKR5UkqtZ0BwhdszShq321i+YfFFxPCQrw7N1MWSNF1icG5Q1B?=
 =?us-ascii?Q?uYBn/gFlBikGEh30YquIbUAYqhNYyLu0BCf9g8WJ5OBqZ0mgSIvSKyu0mhHL?=
 =?us-ascii?Q?z7WofBn1rCCjvzqT/bXIrq1AYeaG17QvMl6XzjFbw4xMeFog71N7jCB9ZJlW?=
 =?us-ascii?Q?A2THrnYWpke1XzJTuzQTrl1MmQqHKowRIhEeEdpfVYCj66/2EuHlqdtNkd7C?=
 =?us-ascii?Q?oK4X5fcBXWDrQ25vyme3wfE7YSMq88DiJZLs9gT15maZxZwIHZ/jyL7muuoB?=
 =?us-ascii?Q?HoAI5CfyaxdkHC6YOOwwazQAKT6SmtNaD73yHryqiILX5muy99yzLSzdZsbc?=
 =?us-ascii?Q?aRRPLZPvlwCkJ3rLSbW6vvLPOejo6FVj/AwE8MEXX+O1O4czC0rPurozTUt+?=
 =?us-ascii?Q?vyrxLOWjSB7Cg39rKMIqBuh4uI7Q1oG1aqIzBFIRjoP7RVLUuTeqgH/YON/G?=
 =?us-ascii?Q?r8mWcLqF0jNniiouslHK0UgMXnvFnTJWdl8v00XMvpd5INY2H09Q0B+F9fr4?=
 =?us-ascii?Q?1SgGd7q+x86DftPibR91d0cKgFiZCexHXJninmO+e8bacnvxBtErm8MHxAdb?=
 =?us-ascii?Q?KtBTa406BZeu1qbl0J2qDz8L10UBC+uCFDt1qnBL8al6ugJoWr+QPGSYVQHP?=
 =?us-ascii?Q?LW3kmYQht/u5KScp+kikxIpndttyH9j3LQTh5F5IcGinSxqR9WND96tHYItp?=
 =?us-ascii?Q?7j72B7ojhRv+Av+g35O06uxppc9C2XMObUEuMDhOBd4ukzEu9fX695/OXyEq?=
 =?us-ascii?Q?gNa5IdwPqDLTSs7pdcEnrwwINXbIUUoYbqg2yzkVCczWC+K/8zKFFNZq7/a+?=
 =?us-ascii?Q?yzcdO8r3nU+WzKlkPBrKG3Y3XxkYXmk/623iebd9GlqtM61EKFhukZQviKvC?=
 =?us-ascii?Q?3PyHfLdh31rCHhRcPJZNw/w1IlTHiNIQZXuX1cT2KmVG3jginid1Pxk9pK8j?=
 =?us-ascii?Q?21Mvks94z491CR5Mr9JFVhEysFlUk7JAKhbOCP7wxucmZAEm/1TN6fIWMaqF?=
 =?us-ascii?Q?9gqHT0BmDtF6vYVnqAatTUt8junE4VKX4LRcnwvXJjc0CNe8zX+6e0viW2HI?=
 =?us-ascii?Q?HZvCz0cdb/lKI/M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PmQ6JEdbX15ECPNoMFaaDi4YLAd3awUoHIJDdaiNUha+ELfAKBp8gQhEHukq?=
 =?us-ascii?Q?yaCbhczwnj8cTEwpWsAY6e2O9P6Uk1/0enyBIrxOSiDb1Y2DHr6yL9OQJSf+?=
 =?us-ascii?Q?JfMHHx6WpHJkasY38c861ZFwmkmYnNEBqzX2/YHNemooPqBTLubpMMTW6Cki?=
 =?us-ascii?Q?e/gRilpD2eSA781c8pUKfyeNiKPZXhHuzjc49R9LqdRpKbi/fgFe0nV94xA2?=
 =?us-ascii?Q?Tj10MSWG+N4ZIuY6YEXsliSQgkpZItPvT/tgplw1BgKxhprqNyNyeGPF8FJJ?=
 =?us-ascii?Q?9qoRCdBWIfSV8uQa/GVPW4vXn93/H5v/wnUr2rDxqqqcwhii+4MHoc6JWFlH?=
 =?us-ascii?Q?5DrP+uB6+NvDMkH9E82BoRFa2KnlOWR5B41aMWy2lkDa+SyxFQ9AzBHrqV5U?=
 =?us-ascii?Q?wxgoM0qUArkX6LmCDngB9OwiWLizFlp6Rj8HWqTbC3cVOIT0yUJKutTLfpQO?=
 =?us-ascii?Q?us5pMd+B5TsRs8CJksckA8ZiNTzwaQO9vAWOgofTU8zhqcdd9hpx2h3hmkiY?=
 =?us-ascii?Q?U/bq2nbfPMYl9Y5qLsnDUnUd+s3sC+0qy1lrbcgTmD7RXnT4O+wuBKfsaZDL?=
 =?us-ascii?Q?IeVszXFD2ndaxb/qXfkBBcO4ufKr1L/BtM3UJCRkY+eB/T65F6G429lj1r8l?=
 =?us-ascii?Q?38h8QROrKR7UF70Whg0GUa3PceHAYVlw7dSlRH5A/86WXsxJa51JvABlPglH?=
 =?us-ascii?Q?9rClQVRe+cHPDVXnN53Ca9xRDqjJ/MUJYNjyXEoxdoZlruWKp9E2dYUX5F51?=
 =?us-ascii?Q?Gvtpjma+Q6vKE9nxVGF2CcqjqxFY15htBNTPJcKX//C16+2HMcfrJaj1AwG9?=
 =?us-ascii?Q?gMvdPVWx+wsi2AhJO2zwJGHMz6uKGabUuvZHu9Z2um+xPfGvG9aTOaf/FPZz?=
 =?us-ascii?Q?/f/7J62j9TyyO6kiTPnonk9lyCjkpB3DxDtckQarhjVJRrxs+LRgiNKRwuLW?=
 =?us-ascii?Q?RVE8z0uxuzokM1q8lzPSEjF3E6EGo8j4QVYe0OWd46AlRTrVuY1CWNMWbwK+?=
 =?us-ascii?Q?8xPhCCnQ55YqoijZygAuGN90N8XJR3qoNtyjm/PC+i6s3TgsjeT1NOiN/rNk?=
 =?us-ascii?Q?8yhdAJRVb94timzZ2cXpIu48JHFTrrJ3XjtubLpJdlgWbI/6yx9HRejy9wPZ?=
 =?us-ascii?Q?9GPVEs6BPcZCBDC/d3OqHm0GymQVXTrBWgw5bfFFo0xYGfYHJtLYNBJFUCXy?=
 =?us-ascii?Q?RsvRVnWTUWfUA4RhHxSBr8gZKvEZAYAc/ZFqZSWhUhe4/Ijvjmf1LXx7szwn?=
 =?us-ascii?Q?p1ud0IHBMI7AjoAWgRrPDGoNPbS2FXvKJtkPIGWSmwvpZ6zSJ8BzNMYCwITX?=
 =?us-ascii?Q?NyAPvGA3kzXSiSoxnsz+32EwhLG0KVbC8oxnL1Cava/gqk2XF2cHtQedvAXw?=
 =?us-ascii?Q?rfT8j7LgRYUFHG4ndSjNKrNpo0TOnbO4vlqI3p0vfnNTyjTKWhxO59bgK5Iv?=
 =?us-ascii?Q?2XEIb/PyyS/3XtxEWcRr2s8baChaemWnr//kxdoXTaejyLqLOppTjZeTTj5t?=
 =?us-ascii?Q?/WIDiou2Kh8vaoxp2hWo5D4AU0MBeYNdFDvS0SwiY8g06EgCIH7+nWE8NBWG?=
 =?us-ascii?Q?lQi49lOmaQEKsyfGc+Uuc7tD6mPeg8bkDrmx9JXn?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e6cd68-d96e-4ea1-46be-08dda3d30702
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 01:48:10.7348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: //tqYJRu2zk4JEZI/rQSKT4liLfruiix04uryuz0L/vEHTGZkxoXeHumyoCat3/eVrbIi/tgFChsnp5lR3WomA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
X-Proofpoint-GUID: PmR27IK5WdGfm6sUsVkfnxkB2WoNWeJa
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=6840f75e cx=c_pps a=J1E+JpBSxTWGFwZU4p+gNg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=A6gBwVhSIv3_1ttho3oA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nlm17XC03S6CtCLSeiRr:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAxNCBTYWx0ZWRfX+o+WnXK/GTCS xycg8BljZOOD/O8FgbK9lDgglfor7pzi3fPY66KmWC8R/AFRuIg1k2nv2Ny+e+68mxDt8RWiRgg Y7J3jKfRvTGEVWDwyubLsZmOlgc/UefVdQM8OxoZ14D+KToXheaEJRu+d0PPGGgYn+A9aEhQHA6
 SIlPWFbBtLe/0uEvWpnHtERBV5/l4uYvuKnKFFLc7uOGTaXKeWrqKyd5V3qdNQBX1TP98NpeTE0 hl3oVG8Dy9Hfb3Ds3BzpRvmfTAkvbeHsokw5loi6VKvRjQxsD+6Qc3+TmeOMv8EPv4Z/QKEYFIE 8a722FAPQaVlI/dDMtuBFaGM9xHoEuq0B8V1PhWHLKqV+3RU6TEFY103PNVXa8cobq9TF+eus0k
 s9zk9UVpb3bUNtAFuuMT/tponc6Hb275MbVSISbB1vYVt5jFpXNeTAMsJCXM1UFF0f6VhiuV
X-Proofpoint-ORIG-GUID: PmR27IK5WdGfm6sUsVkfnxkB2WoNWeJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_05,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050014



> -----Original Message-----
> From: Peng Fan <peng.fan@oss.nxp.com>
> Sent: Thursday, June 5, 2025 10:42 AM
> To: Frank Li <Frank.li@nxp.com>
> Cc: Li, Meng <Meng.Li@windriver.com>; linux@roeck-us.net;
> s.hauer@pengutronix.de; kernel@pengutronix.de; linux-
> watchdog@vger.kernel.org; imx@lists.linux.dev; shawnguo@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; linux-arm-kernel@lists.infradead.or=
g;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [v3 PATCH 2/2] arch: arm64: dts: add big-endian property bac=
k
> into watchdog node
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Tue, Jun 03, 2025 at 10:55:01AM -0400, Frank Li wrote:
> >On Tue, Jun 03, 2025 at 12:02:30PM +0800, Meng Li wrote:
> >> When verifying watchdog feature on NXP ls1046ardb board, it doesn't
> >> work. Because in commit 7c8ffc5555cb("arm64: dts: layerscape:
> >
> >Watchdog doesn't work on NXP ls1046ardb board because ...
> >
> >please wrap at 75 chas.
> >> remove big-endian for mmc nodes"), it intented to remove the
> >> big-endian from mmc node, but the big-endian of watchdog node is also
> >> removed by accident. So, add watchdog big-endian property back.
> >
> >extra empty line here.
> >
> >> In addition, fsl,ls1046a-wdt allows big-endian property, so add it
> >> into compatible property.
> >
> >In addition, add compatible string fsl,ls1046a-wdt, which allow
> >big-endian property.
> >
> >>
> >> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for
> >> mmc nodes")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> >
> >after above small fix
> >
> >Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> >> ---
> >>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> >> b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> >> index 0baf256b4400..983b2f0e8797 100644
> >> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> >> @@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
> >>              };
> >>
> >>              wdog0: watchdog@2ad0000 {
> >> -                    compatible =3D "fsl,imx21-wdt";
> >> +                    compatible =3D "fsl,ls1046a-wdt", "fsl,imx21-wdt"=
;
>=20
> So ls1046a is really compatible with imx21?
>=20

Yes. I think LS1046/ls1043 use the same watchdog device as imx21

Thanks,
LImeng

> Regards,
> Peng
>=20
> >>                      reg =3D <0x0 0x2ad0000 0x0 0x10000>;
> >>                      interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> >>                      clocks =3D <&clockgen QORIQ_CLK_PLATFORM_PLL
> >>                                          QORIQ_CLK_PLL_DIV(2)>;
> >> +                    big-endian;
> >>              };
> >>
> >>              edma0: dma-controller@2c00000 {
> >> --
> >> 2.34.1
> >>

