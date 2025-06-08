Return-Path: <linux-watchdog+bounces-3647-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1053AD10DA
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 05:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2E43AD77E
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Jun 2025 03:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72F6192B75;
	Sun,  8 Jun 2025 03:08:48 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF101494A3;
	Sun,  8 Jun 2025 03:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352128; cv=fail; b=OuSsZSn579JM3qUUtLDVAdEaYy2N+b5JZ5MCpFtu48HRFQi7XJFPi5EWHv+jxP/f4zywG1/UfOa+FKbkn7laFkNWpatYWxl8Tht2bsPWYfZ5gWy2/FuIZpip+gpcOOkB4ayDhQoMZ2DXQNYcXZNA+J4LBQM8NMjowc9bUo/ENJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352128; c=relaxed/simple;
	bh=8H8JbNZSuPrKfP/m1LAmkuq599UjONhRaqh4W+z3SqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ewqYWsP4yvvWjkbKKqsttjL3+33Ofa77wwuyAQa9sZKG3srDE0YNZLqH7HfnuKnZFecShbtAJkBUTAFyA9Daael9tdlkTdxmdIwd73TNRIcaQTxyn7YaOQoqEYkfXw6CoLuZWTbRDuOpck6ekV0Hm5wwfSl9tAgLrY//I+dST4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558303JY022129;
	Sun, 8 Jun 2025 03:08:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2gr3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jun 2025 03:08:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsBu6965DaF56rF21v+6Mf5p8JU1C4LLzwcX2LQr4yxTIY7RFz9Vw43UKGAGKx7HF2drfQjYn/zIQT2A9CJfnqEcXmOuCwSiTUz05abspNvKSdgYn0+tNGchpAXndLd9wCiVkYrQJQQpEjYMp30dzZtmgkcKFAdj4CQZ/YN6NL9CXkWSPhYn1CJ/FWpHbIvGswBfFxMQwXm2roBu5EBBSoLw0/5uN9/Dj/8slsHB3ZpdhGqRogUSYrxHRWalB9GdKk++3RScQqgsj+wlomD+sCMMJWhmg+IL16Y5Xec0eeNPflW2YqQp3/jA7T6dolsC3l7/d9WGXsHf9dvoGIdemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTKu5QpV3ttok7E6j3zYD3j0eXGyJEfBDY0AaIaQJ64=;
 b=LLSCYTbZi6ItWlcIszmugasO/mYxpg9FkmR9yaPfxrJD9+PsBjG3N7zMWgkSFCOGV6n+ZCSR9eemT0vgZbY6gLxHdnLosf9eugcohf2+1clRQQTbYIEIuvJeqO61QSiD0qU9T8Fw0RcCyyjfZDH/S9RaFazX8aFiMhTyC0owZdiBXJM210rqKL2yMmX6VXeP/Pcga2EVFgmnsTl/l2Y5cbc4JSU3C4BXDMELgYQtAg2E8JYVrL2oaz3JHwdhnAmHUfPeHSQbQm81yzvvydbcLsycT/gF/iXF/GtWjxU136eRGfqdgk9/N9HUzGlQwr1ZZ/TRH7wJpNB/sSUiFNApKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 03:08:05 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8813.020; Sun, 8 Jun 2025
 03:08:05 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Frank Li <Frank.li@nxp.com>
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
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
 feature
Thread-Topic: [v4 PATCH 0/2] create patches for nxp-ls1046a platform watchdog
 feature
Thread-Index: AQHb1QLI5R/2ibUE5EeNzvAcdCsKlrP1X0NggADnowCAAlP0cA==
Date: Sun, 8 Jun 2025 03:08:04 +0000
Message-ID:
 <CH3PR11MB877395E7F25D26550D83481AF168A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
 <CH3PR11MB8773488D4C9E9C7A9D44DBF9F16EA@CH3PR11MB8773.namprd11.prod.outlook.com>
 <aEMKeMaka8yLtMEc@lizhi-Precision-Tower-5810>
In-Reply-To: <aEMKeMaka8yLtMEc@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|SJ0PR11MB5813:EE_
x-ms-office365-filtering-correlation-id: 400a336f-91aa-4014-fc71-08dda639afd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YN9IvQKagbqi51D85ERrnroNXtV+A/LVw4kl/CBjB8Xj7faNtGEYQGTSaCFC?=
 =?us-ascii?Q?OnB1dXetBFyxqWejm9Q+Fa9VA3z3OftC8vJjD302qOktZgB4tqBXoqL4BCBt?=
 =?us-ascii?Q?VcWFgkmf2HSjmvHtTp8oru3VTmYBzVvUWLXERGfWndWEOn1AF7oIGVc4rrRT?=
 =?us-ascii?Q?FjHWcw0T3lV+icL7Yp+Y7AOc350YUViWahinx0xMn/QG9Qh74c5ianldQcGw?=
 =?us-ascii?Q?3nJ+y1TXVHUVF1XDy46O33TCufK3L+DPfH+z6J7PkXt5kb7F+rr4820gBRm1?=
 =?us-ascii?Q?WECwv+1TQQ+K61gfUg0uz7tNxZe0MHcW/D7aBWp5aqT2gqB28/P0xIUylus8?=
 =?us-ascii?Q?rRdfcrDZGdUHtUNanbkJExrC1qdKgyqAWoxs1vqUFu7tF57Vw1gZurEhruor?=
 =?us-ascii?Q?MMRd5dzSXU2a28O+s1ZB//xp+pEa3HyusyzFt+sZM/lGO1nrUQsWK09c3BFZ?=
 =?us-ascii?Q?LUywkMaeRMkEfu5tAVE5ForwGfp2PilMJd/caHUQ7xYhUyl0scXukRf7FdP2?=
 =?us-ascii?Q?hfojpMWewq6UYWfrZD2aQLPF2SbsgO0rd+0WDIMOTGI1MzraqMDoZMp6HunE?=
 =?us-ascii?Q?QZu7Ypx/5+ZO2edAMPK0qZI8q8gb090MPL+sN62AxHZmUD9Rbj4aNY2lNYSx?=
 =?us-ascii?Q?ZQIiQVSlVDUHrqiDhV3tGVyyprGsTY350WikKuSr8R7/sXMyJnqsiMdJCOwb?=
 =?us-ascii?Q?NnWyX+e7XVRwkJb8jbR7br9JJaUdS4mPDOjp0ez/S615Rp77bgeN0TTnX5m0?=
 =?us-ascii?Q?2l/al3f3mDzxhAxUuAdLQjbptjbT+yNKv7lLsKvRaUhLnJItNb9B9AgvRNMX?=
 =?us-ascii?Q?fF9BFY3BNvHio8lpq+H9A834BxTvq+xYPS8WgON5Zu6lJd9IPIWZSgOvS6Nu?=
 =?us-ascii?Q?jUW5ma6yU3cqSkvGkSXyyKtVsB1gg+4RzAdFL0F0OesdxuwxiojWoGK3cPaX?=
 =?us-ascii?Q?6ab74EbwIO0QwjIJTQLguMurnAEHYQ0w4rVC+YnMgjKV2hSV9VMFSyNwL1pX?=
 =?us-ascii?Q?4KVvXN/E0HWHkINnyt52KCC314sd3ix8OyuIK4Pt6Xm7VbUHWqxMPrSsoIAA?=
 =?us-ascii?Q?RWeGvogdxwuPnyyZuwOAwtSSoLdv71TslkqFor95HpMq3gAO/RN7PicqJyeS?=
 =?us-ascii?Q?gZcI9OxnoZ8caPwjSwvDAPipps//s9Gb1TT7GplsbJn4beWLlquAKzyFoNN0?=
 =?us-ascii?Q?0JZ1Q4tdziUZd65kjdJoK2gn59R0J05jl7wjotsv2ZGtifOcGULs8h+eQc9P?=
 =?us-ascii?Q?v3DNParaFjyoHhSyP5r77FQ/0WJL7hOJ/dOJ6Y8mU5KGZxry04Suxa05xzgM?=
 =?us-ascii?Q?MrjHcx9v1S2eMzcQftVceGu7vxGQ1ZFwdrUyvcwXOvWWAI8vvepol2U/pTt+?=
 =?us-ascii?Q?5VzdojK+X1yZ7LaR1I1DB8YHF+Wvk1mNhcVI8Tbs0Gp8+3eqrbasG3ldBBud?=
 =?us-ascii?Q?qIFaFQFGnw/VqOh0bBnuZiNiZP4JShG5wpVpufqljC/9JJfSrlIAg+CUG5xs?=
 =?us-ascii?Q?A7TnddfryuTD2Dc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qrXZd9kFBWeuHHtE/gxV4suwkPytatx1VEP6CIJjtxYiHB82jYLbBFh0jNlu?=
 =?us-ascii?Q?SNpGZKyDTyQ+BGmmTNTxGnd+8AujlSS+mkZkhfvJ1BbfRX2WJSKk2moOzFIs?=
 =?us-ascii?Q?hnA0kjWCgwl2LMCN8AjXcrC/vjOGwx6K0EUZUWcJYUc1EagbWxK/YxFZ1GCH?=
 =?us-ascii?Q?vphb1kl+XR1dBakUJGA9lTcGaQIAjkmsNVT0idkVNpPZtJO07LujzQofAyKG?=
 =?us-ascii?Q?ZkaslSrculilNAZp+buUbBDKa8WvXW2/CN8xD7MRjDB8DQ3goyanjLu+XdQD?=
 =?us-ascii?Q?QQD886SyV41hQp9qnnWHT9raQKBdSs4X4wYookVI3tiENLM9pCkua2gcQPuz?=
 =?us-ascii?Q?xk33mgDiAcaNe2kZK7crGqp6Ay3Q7oR+SR+3d2i8pLrWre7F4dmmXFpEABU4?=
 =?us-ascii?Q?hAtCEQ8P8H08I0h0D/FTRtzZ4yWAsl2D5Cyy7Wp3RC2q+4F3OPD9f5nAhlV+?=
 =?us-ascii?Q?9HXKbwTylzCZXXJZKB1Wpxlr0bSGshqXE/4emFt2bBdHI/3CPwZ1ZvyIOKZ0?=
 =?us-ascii?Q?2co3GhqcbTTmFtrUS3Ww3x9oRl3igY3uyh9zg5/O1CaA4mKmYwCYrE1npk+O?=
 =?us-ascii?Q?4yNRDa1mvOQr/ESa8KmY/DNP96+yDTW0oL8aIoxQcQ/kE1qwtH4Qn072XVRs?=
 =?us-ascii?Q?awCSp+BlxoMWFZ6GedvdiGcMZ6KD3P2w++KPDdHOKidU1F1M/5BoHXpdttIF?=
 =?us-ascii?Q?u8GbevVHtGLb+KsgmiW+7kLssLElU2GhZA9aCLly2fgKuZbDTRQ5wpgdHfpb?=
 =?us-ascii?Q?gdCJdQnQ03cYHE34XEvLfbFv+bFrJWjAMRn6xeiKJXHNAdOaZ9J171/a3BYz?=
 =?us-ascii?Q?5Cb1pXYeQv0t0JnatFQsDHAnvgNVluGFLhAzk1KWTZ9md2YyshDJizSLXCY/?=
 =?us-ascii?Q?xeOXqOdlRkJHZ+81gEDgxjmhGxnb2bEiNAeIHJhUhLyEeLBR0eqpl23wRe2e?=
 =?us-ascii?Q?o/xX6sI1659aoRwzQzjQYepJCd7BDG9x1N5KH1be5TrcoA502xd5TukyrOzH?=
 =?us-ascii?Q?fKtkK57p9s7oG2P0/Y7Fmf3kTJyewBpFI810OZ0oNx6D+D9dl+Xg5E9LOti0?=
 =?us-ascii?Q?xIRAVr8FWP1VHsYUFKK5E0qaks2Vo2jhWrhnwmLvsfdTAy1/nT3uccvJ7Kzx?=
 =?us-ascii?Q?LqLzeLAP3o+eOfrJWTFvUE8IajmBFKlcD8U37bFT+/m6sUW6pIj5FTjzlkmG?=
 =?us-ascii?Q?62AxRc5KPvb3GsYj1S2ZLAw1YHQ3waXjwKyDFGLDD1jjVSFO6pDVI2BBE9cB?=
 =?us-ascii?Q?7ua5GYqfsvtkRkaz1KqiM7JX6x4z5oHP5KKjqbd0mZPjtvP2acj3T1CBvR4d?=
 =?us-ascii?Q?tl4vOj3sXtNhJK4Nj6cPSUZbWeNswj9REejHTyxwglAniaZK9BxVSwWm8JdB?=
 =?us-ascii?Q?5xMUs+QEKX1vRXOjB20yZlxIWB9OdiCts33ccuJxVSgwxzBfduZ+eKFmLOtV?=
 =?us-ascii?Q?iA26lqeSTZQLzGx5b2g4pmPz2z8Sl8P0QbLKU40xRIQ598NMgO7ZVHysz9j9?=
 =?us-ascii?Q?t6V/+JyjI37glhPfe796RT1ZI4DEV/jjlDz2OWEb7GttSamhUCwdI9QKCJxv?=
 =?us-ascii?Q?7yGeoEhbrSkdu9W4mRxpGiR+hden/G44n9I6cIzZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 400a336f-91aa-4014-fc71-08dda639afd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2025 03:08:04.9550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZlMXdxWGXyJ63Aa2hy5TFA1hgqkaj9u3fFE4HQCzSeb8SNOwXOBM0eMVAQ9STvOz8DCdXxQNWs0vgdPIi8Lyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDAyMSBTYWx0ZWRfXyfcKEakXNiUz fJ0ZEb9vhrTXN3Ps2F6S2ma/3SX8KFjd+1SXqIIfinl0ZZ4t/jGfbo98ldvxyfx4C12vvQWjtIA 5UgqSAEjsvXYwYEmWMs0Nf2rUva5wL/Iu1BLgv/axfZv9C7ZqYfwWN1s5vMgWe1Lv4eNWmnxIFc
 VPOabKMA441S8/3P5layAMHq3urM8cR1+TGfgjmNA5QboJqCcnIVcBWcpfbTCioD3oBzYX8PgSK FnvHEPDhwtkISL6GLqG6WA+JjkmYQMl3sBC/JXYBAd2I6JGltwdmN7QBj+5mE+Yfqt0rzgnwiya rc5vVSNVM5qI3WgEQv5egBQHFvkAGoom2pdLWipqcvoPXWodc6fyjrZwlB2n19YSY0QDkk3LmAV
 PnD+9FNOtx0Y22LYpQg5kFsUBqMuc+3dCsyfqyy3+0g3gvYTZ22qgy87UUQgZTIZ7PGPVA5w
X-Proofpoint-GUID: mRtSzGWEx-LxnJHO0tPc7MUqlGlBKW54
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6844fe97 cx=c_pps a=RuymQIG3+YzwfY4kumoM/w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=tOCxSLjmQqWByJu3keMA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nlm17XC03S6CtCLSeiRr:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: mRtSzGWEx-LxnJHO0tPc7MUqlGlBKW54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=983
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506080021



> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Friday, June 6, 2025 11:34 PM
> To: Li, Meng <Meng.Li@windriver.com>
> Cc: linux@roeck-us.net; s.hauer@pengutronix.de; kernel@pengutronix.de;
> linux-watchdog@vger.kernel.org; imx@lists.linux.dev; shawnguo@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; krzk+dt@kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [v4 PATCH 0/2] create patches for nxp-ls1046a platform
> watchdog feature
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Fri, Jun 06, 2025 at 01:46:56AM +0000, Li, Meng wrote:
> > Add watchdog binding maintainer for the patch-0001.
>=20
> You may need resend whole patches, which included linux-watchdog, they
> may use patchwork to track patches and miss this one.
>=20

Thanks for reminding me.
I have sent the whole patches.

Regards,
Limeng

> Frank
>=20
> >
> > Thanks,
> > Limeng
> >
> > > -----Original Message-----
> > > From: Li, Meng <Meng.Li@windriver.com>
> > > Sent: Wednesday, June 4, 2025 11:43 AM
> > > To: linux@roeck-us.net; s.hauer@pengutronix.de;
> > > kernel@pengutronix.de; linux-watchdog@vger.kernel.org;
> > > imx@lists.linux.dev; shawnguo@kernel.org; robh@kernel.org;
> > > conor+dt@kernel.org; Frank.Li@nxp.com
> > > Cc: linux-arm-kernel@lists.infradead.org;
> > > devicetree@vger.kernel.org; linux- kernel@vger.kernel.org; Li, Meng
> > > <Meng.Li@windriver.com>
> > > Subject: [v4 PATCH 0/2] create patches for nxp-ls1046a platform
> > > watchdog feature
> > >
> > > v4:
> > >  - Improve commit log of patch0002
> > >
> > > v3:
> > >  - merge patch 0002 into patch 0001
> > >  - improve the commit log of patches
> > >
> > > v2:
> > >  - improve the commit log of patch 0001
> > >  - add another 2 patches to fix below warning
> > >  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb:
> > > watchdog@2ad0000(fsl,imx21-wdt): big-endian: False schema does not
> > > allow True
> > >
> > > v1:
> > >  - create patch
> > > 0001-arch-arm64-dts-add-big-endian-property-back-into-
> > > wat.patch
> > >
> > > Meng Li (2):
> > >   dt-bindings: watchdog: fsl-imx-wdt: add compatible string
> > >     fsl,ls1046a-wdt
> > >   arch: arm64: dts: add big-endian property back into watchdog node
> > >
> > >  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
> > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi              | 3 ++-
> > >  2 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > --
> > > 2.34.1
> >

