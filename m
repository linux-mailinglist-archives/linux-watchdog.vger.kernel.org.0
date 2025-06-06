Return-Path: <linux-watchdog+bounces-3640-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE7ACFAD4
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 03:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A72188D001
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jun 2025 01:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F391649659;
	Fri,  6 Jun 2025 01:45:10 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD227454;
	Fri,  6 Jun 2025 01:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749174310; cv=fail; b=UK5i1oNZA3SVFBAjUL0QUTOm5nNQrVBqUDhWRfYFPWejNcmkXl5q2H2+fIJ2gxoVAgPqZCIzYQ1CVmQXZLrAIV79eO1A0SYQI/Fvyjry9mpw+ruQalefIyEXnXkadKAMqWzESncPMQv2ALz1xZUgC0KGkYlvFiWlvhMuZClKJzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749174310; c=relaxed/simple;
	bh=6Faf09EDG/U9Ii8dB4hYmyK5phGIjLk2dNw7ZAEh++c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LH2UKEMpGOslBFsxg2sOfTxfEYBqrlEsEaFvyaEfJy29hc3Wfr312qgcXdDruy2bQfX/MdGgYeVkhKdGYphvfp5vmwgDYpc5qZXbOZq8dTT55A/+6s+0sfYGxxcxKqf74zQVBfKXXOyQV+67S5x4dGZB0BdWfRvVpDR+I0SiSMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5561JorU012122;
	Thu, 5 Jun 2025 18:44:34 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvupa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 18:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDLtw605/NPY+8dPj0IlWErxPEwQJw9HItr6ReLL1MnVWAWA/2oKVEYMVk2Qvx1/iB4q8BTUjKtUpGBCQbUlaSzypdbcbi4+X6ZAy2Avj6qqhJng0ejtB4EZvYbA8ACS0fXHr33ZgLC5gsAgoi5tgtpJ5nNHXJ4Frx5tMT9s1pQwvyjhNhqdH3x83KJf3OH2ZeFKI+Da105+aXal96ULl6Q50Pl60B9WRo49Utn+e9KtRMOdeLRKjy3g+IxBVhrXPnasfVWUNYhBQilnAwihWMgKOmS7tQNdgiPxFMNXPych4QjbmeDlkhA23jXbPftpY4JcT6vpho/yrrGu53nJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcdBLKHtOsDna+PitsbYGyO2dB6d0bIrDrGtP8qJeuI=;
 b=onsXGYVaatNhCEuKbPijmaHjMppEs9rd4U8P/AeZn+fgVuQX/3zEnyTdoRi9rcEfMjNhi6iveSpdjYOOU8rD5jCEvanFEHt8N+2h//SRGleHwOhnkN+JK9Qrid6a463UVCY052DM4ZaDmhpjzTgp7fg9Q0BHNSXTf7y78Ck3SXBVoZJbIlyURNX3HQiXShixPEaU6hB09n8FyziI2NtgXxZUyDGjo0Vz9sh97BC2/oEKaHLg3ED0L6kLliNs55fcc34SQBxR/dUdH9FISXHpZbm8Tl1OEFeVX5fcOK8GB15OnVW5MdiVYhuf6mbgJ4KodOzTyzFf1qI4a8Qcs6yZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by IA1PR11MB6345.namprd11.prod.outlook.com (2603:10b6:208:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 01:44:29 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 01:44:28 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Rob Herring <robh@kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add compatible
 string fsl,ls1046a-wdt
Thread-Topic: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Thread-Index: AQHb1QLLGXm4Wb9XyUqhsr9BHWwP1rP01+AAgACGshA=
Date: Fri, 6 Jun 2025 01:44:27 +0000
Message-ID:
 <CH3PR11MB87738CC5B3CDBBEABA538339F16EA@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
 <20250604034246.3234837-2-Meng.Li@windriver.com>
 <20250605174038.GA2911346-robh@kernel.org>
In-Reply-To: <20250605174038.GA2911346-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|IA1PR11MB6345:EE_
x-ms-office365-filtering-correlation-id: 9e692863-dd26-4ff7-f72a-08dda49bacb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PVOeBaGdaUAIwTuQkPlTc6tJAq6Sju4u5N206CSlMon/iix2w47Skm69x2pO?=
 =?us-ascii?Q?CBNJXMOWaSp9oOgIjcUVEsERUfAVhBymfYanIoMRbomSEg1BtgOG1OrpYQRy?=
 =?us-ascii?Q?M/wItQG+0gH+ehocrJyGWUZB+cVWH30ILXmtUIR/dL7qenicuiFoJmctriqA?=
 =?us-ascii?Q?ulG5en8SSgdudFqVSvHxNeMyL30oiJEW5D7PfMp6s3JfXCcTyXbL+OKcoomv?=
 =?us-ascii?Q?GZfoEWfdEDAa9cTGvXT/NNGspE20UtghUdPdEz/be5i6zsl+hFyiOnnS+ioO?=
 =?us-ascii?Q?DOQbL8a6JIyC8ngx3s4n1s7pV2EuqPJUDAP3VFCeTNUj8AgoRjC+wF5mt2ot?=
 =?us-ascii?Q?/+EnMQeDoxQ7rdEL2X7HIOvaZwk68QMHND+Wd3rUfc4wgGBx8pihIdy5uu3D?=
 =?us-ascii?Q?/UfR9F41hoWe1p1UjQT/gjTbxhvAYI27DL0o51QNTrNAvkvY2cRDz8fF5Qel?=
 =?us-ascii?Q?NtzuuDBNpd0RaJqVcjDvlMoszIHNmrq7Wmlq2aWRMCAVmz1T5Vs9SlI4kot9?=
 =?us-ascii?Q?Ma5O17PrrlRREdcQpjTr1+F8LxPUFjqWIRpzHSZn8Krqfo2D4moa47KQk2PW?=
 =?us-ascii?Q?lG/VhS5yWmzytVAtBq/euTpbX96Y44il6Ao5i9dZHiSAcEaQlxsc7rURW8oH?=
 =?us-ascii?Q?CbkL0vrBJZhQz4dp9ACzFD6gMFeNY+cIUhMfQLdCp15NiSiK3rMCDaab3ESG?=
 =?us-ascii?Q?DEfTrK0/gsHL1xL79MwIpYvTcGrvv952g6s2hBfSFA3lbnkT6BPVML/Lxq6e?=
 =?us-ascii?Q?XSSe9rXbjHcaiLSFibVFZCZKKcotme9jz8q7drcsFtnusYMLqPhM0NY6HBt/?=
 =?us-ascii?Q?KgMXgImNB3I4i6hqMcnr6o6iPNukD538OaV6Ew0v/7XS/P4hPQi6iEfEtS3x?=
 =?us-ascii?Q?Goy31RRTMfQcpDX8I+VJMiAlCgoJ5iA3yEez0+J4O3cZlHzkX+8TpBbaP2nZ?=
 =?us-ascii?Q?UvfXOES+2+TNHetUTXnTMbUynIbWSseCD2fU/YldzShF4JKTIB/FkofKGa7L?=
 =?us-ascii?Q?XubO2L99oLONuWiVyF+jx7uzThXVQkfzdil92g8HrS7Y3Eqe5sa7VCgF2yxo?=
 =?us-ascii?Q?785NWJYy7lBIzAS2Guq7O3RbT78h6PPLv/S+IbzQ3cc6w7Rkbh0IUgZPZxTI?=
 =?us-ascii?Q?kdAut0zw7g0UT/W8eeFjqYjsg2kT8/LwTmrpH08Z5HeXH7+6P31tjzgyKLBA?=
 =?us-ascii?Q?QzMRaLlDsgeif6e6OeHVY7aa6RNPVHc2vwLkYemfuqIxqBpe993Vcphvj8x/?=
 =?us-ascii?Q?pu4Te77/dPwV7AFhC6JN/5qBRH1DDQynsBSJTuGz23+t8hcLqGOWqLK0eZUu?=
 =?us-ascii?Q?Q+B2t+pv5TtwRXM3x+xZACPZJ6BfWMRO7qd3MrLqLhENXHInm7JSUlzoG7Qk?=
 =?us-ascii?Q?MD9bEkQIZuWKB0j6Za26a2Wx1XDEupS3yooBHPkf3rcdHPLCOtHFQTmGuwpM?=
 =?us-ascii?Q?GAkupZOfv261pNdxI83FgVO2bkOTc07YlXhstxeuAS3gHJmlXQFiLKhwvXY6?=
 =?us-ascii?Q?ik9/wERNC6T0TEA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WLK0ul2GefIAm5IJK83F8Hw0T6WWPWwpwCLGB4LRkciQZ+xx9DkTQ1xuq0tf?=
 =?us-ascii?Q?kw1HIdpChrB9zvFarzyRghxcAvcWMSLLEPOCOWF/wZQwCJA5XUPILF9BCgem?=
 =?us-ascii?Q?YHedCfL2FxqKei9UakJ2/X1FCwl4plWOLQFFNjvnz9QFCpTKzlF3BOxtZRIx?=
 =?us-ascii?Q?/fdrFiUGy3PRKu+aFetheP/wWT0TeRycRHljpZ0+AApaSTJFAOPDAkbyFGZX?=
 =?us-ascii?Q?d9GSrYVXa8qG3qnHVlBrEUkmu5e+FgB8y0sBD7io8VAupMx583u8JmxS82Zj?=
 =?us-ascii?Q?zlTJkk2dmErl+HockXRqc4ZmwYtIM2VbGkKxvXqTej3G43IXNGz4MMjy3mzK?=
 =?us-ascii?Q?bbNN2mKjoqNtqCb+01rmSJ7u3xhlO6KzuzEKrCmR6SZJUNUNCWQtY7sw0sJ/?=
 =?us-ascii?Q?9jIf7Yr9gVSfxCB+o8Id2CzZr2pYvmdx7pwR+ZUn4dnIqXNvHK9tE4EC//56?=
 =?us-ascii?Q?e233I5sfpi1Mjd/dI9ORn6+StIoYZgXY12vMITzxwLcC5Ri3qHKuaezaEDa7?=
 =?us-ascii?Q?PGqmmGgT6FqfTK2u8/kEVd5FInZNP0ojnEODd7cj0cAtkSTVMwUdHh/oSYHn?=
 =?us-ascii?Q?IRIaFOu/QriVmYk+7//3xAnkG/lT+y2snYLsAddVpTL9Iuki5CSmdYwmOBgZ?=
 =?us-ascii?Q?VQzzuZjxbcL2urUnbfNHoxtjgs6ipOJmNbUOJuas+GXq4hHL6Ft42SngQno7?=
 =?us-ascii?Q?ie0vmvbWWHpETK2FSccpkn5VgLh23+4DH5dW49jEH2xkIeD2E6Qj92DAM0Qf?=
 =?us-ascii?Q?HmpPav/weNQLfAwJDrv4klcMFBlYhpKpQyuAfjkrayFeWVcMs38nuMu4YWuk?=
 =?us-ascii?Q?Fe7bSvyQqfi9q7MFy0WHcGZ11+sZNwdzAcCIfZLVvGNklY7IoO2IvSle7i2o?=
 =?us-ascii?Q?hRvEKt6jVIzlp5C3yN7G2GDjWaDXOFnd3Ak07y+BQLdDxlocTQURHuW3YA0s?=
 =?us-ascii?Q?V5LkA9wuP/mkRZg5noZULb07Y74LRhcRG6VdJ549L4zFI4spsOvnxmcvMCMj?=
 =?us-ascii?Q?MsQtxBTUyUAIZuQJ9M0R197T1nmlgTSOF7mEgmBLot7iq95lHve2ZE4CIPrO?=
 =?us-ascii?Q?7NjTZogdpXbCqa2O1J3Zh9deXJSOHngqPVMM0GwGg1N6IZtO3QWrmGRPUT87?=
 =?us-ascii?Q?ztrrCrdkRTeNZrQkvkOKLoIEdFFThc/9HRK2ulyGbGLjHDYlL4aXfHDpvvbs?=
 =?us-ascii?Q?QVAjISCHeobbZVy7t3HuU4NuHoNcouV/B6erITrtu854dXGjYFNNi2AhF6Yx?=
 =?us-ascii?Q?itPNHzVv7EXANOD1MJ9ycMjIY6Te2mhDsgovhtntGQHCmm2k9RfsRlFG05Qm?=
 =?us-ascii?Q?oy6aOwzzf5t7N3IyaeH/VdcNcWMp/0N028mRvI0LhHZmEWraqIi6Vb9jecIt?=
 =?us-ascii?Q?Yv/AnDJ8t5a0E82U4/34Ax1vd8gB7i+BB/PCI4dsgYHtpUFFp0GSLrum+0EN?=
 =?us-ascii?Q?Av7POPtVRS1I/dUqAQyxRaL9ntfU/EillPMblePpEOtHrwa4BEZpiQS6NT5f?=
 =?us-ascii?Q?wKVZOuVpRFjHX1CVc/BmtuyI7bzCjiuUPpWvywjFk1gEuKT3v8qyNUCQvw9k?=
 =?us-ascii?Q?LDfZ5skfbFeuu5SbwM/ylAraKFyXEg0OI0fmmf5c?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e692863-dd26-4ff7-f72a-08dda49bacb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 01:44:28.0470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKKCKeu7u8nfVDgsCh5yv0KqFR/sbJT6zzzhPGTEwehpyOzaOdP02rUXc+OVl0AIjFzaVlpGRZFKU9+2T8VliQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6345
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAxNSBTYWx0ZWRfX21aTAwQy/1R4 X1sOd1/TUdiIFBLAwXmELBd8okF3iOKLkr4OknuoKowA3VC7+JHa3Xu7/tCN0vSQO/0qOTG43qa 3EBQoWvO/0Y44UXH6oipNaXK39STd3a+gJwwSKqaGYEFnPnRwljO3ZYMAEsSxxzt2kHddFtV77h
 4VccFYKD5NN3LKduGW3bFC73njSjxB1IRvupDKj8csK8pchSCQczpHvF36AZu5LX2AnGH4519Y7 2fouryPi7hv6C+CsDbBmjNhtulwroVNRdopUwbgmyhYToS73eoxulpZsGcVbQzd4hkeFOsDr7If 3LfEpia8KEuNFhIYAeoC8uFcUshuXPaOOzHoNl3526YeKjIBty96mWssKZquanBlV/iqZ3+WLp/
 PBdPo7CMGYBnyoHH3w8ZYES4JTlDDLXVatsf5sEAgWv09dsl7cPJymZGMTzMY4FY4hUX+6Nk
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68424801 cx=c_pps a=C6wV1Oyh/BQbLcKcsSgGIQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=_jlGtV7tAAAA:8 a=8AirrxEcAAAA:8 a=JfrnYn6hAAAA:8 a=oV2sogOE-RA6AKdDiLgA:9 a=CjuIK1q_8ugA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=nlm17XC03S6CtCLSeiRr:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: NGcGa2ThudIDv4elXsvwFovHoVTR12Ts
X-Proofpoint-ORIG-GUID: NGcGa2ThudIDv4elXsvwFovHoVTR12Ts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060015



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, June 6, 2025 1:41 AM
> To: Li, Meng <Meng.Li@windriver.com>
> Cc: linux@roeck-us.net; s.hauer@pengutronix.de; kernel@pengutronix.de;
> linux-watchdog@vger.kernel.org; imx@lists.linux.dev; shawnguo@kernel.org;
> conor+dt@kernel.org; Frank.Li@nxp.com; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
> compatible string fsl,ls1046a-wdt
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Wed, Jun 04, 2025 at 11:42:45AM +0800, Meng Li wrote:
> > Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> > allows big-endian property.
> >
> > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > ---
> >  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>=20
> You missed Cc'ing the watchdog maintainer if you want this applied.
>=20

Thanks for reminding me.
I will add maintainer in v4 review

Regards,
LImeng

> Acked-by: Rob Herring (Arm) <robh@kernel.org>

