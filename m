Return-Path: <linux-watchdog+bounces-2754-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A581A1B65F
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 13:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8E17188A076
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 12:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D373120ED;
	Fri, 24 Jan 2025 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V81zkqLO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F871BC4E;
	Fri, 24 Jan 2025 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723321; cv=fail; b=splFaJ8hjFuREdTe8MjPYYZ34fnhUGu3RtrVQg2PrbbR4sEDGLrbM1VCi0z7FZMOSBgumuZ63hVgnJcAAIBbphzVSfEDfEs6oKFvsdGDXMGgugVKy/Cd7aqzpOd1sNKC6vTKFi46Eo0yqMYrGBE7znxw6IMhtJUzPG4dJC7A4uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723321; c=relaxed/simple;
	bh=QaVeUMjiTndMwJk2nYPdqJn/3cllfWdazjl86mMEp68=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lNJ21wx7t+0885kRQX2/LQmKGf91/puX6bgzXGUSU90616CBAaY4gHKsEg8vNBzg6erE28cd8e9p4KAzB9+0kMDOu6amEKJ83ey9009Iaobe+VeurrF3mqP3EhYn9A+X1BLagopgeMH/YWkl9yzkDmYrFOikC2xl4z5F3uFcx/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=V81zkqLO; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIofMgB5gchVZVywC5ae3RL8wH3DG9nPMsNBuwIX0+SlcwtYA9fn7OqjUDD35QvPQarweoiUv7y7sm4j5iE8pgS9u78Wt3jNbqu0Me/Az80xGDOElBAkdLzs1gPuQL9WQsvnFhCHK0GzKUkPxCDDXVRHgFQRjuHeWHsSYP3yA8Oq7ft82pM9JzT4/Pf63aSLbMQOvwbfk62GXgwwhoxpwZ4Rh3s+8mvi2RvrAPJB/XxWILVMaCIG3zPQ9ZTjfmOTybjZQk4yMMUyTxuFr3sGP7JUQntWaxViSVjT7IvP6TjehvfsEyILYTvOohZ62Y4fsO4cIk+wgSuD4M+Q4NdmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaVeUMjiTndMwJk2nYPdqJn/3cllfWdazjl86mMEp68=;
 b=KgwIQKcou9fVTeZjc5uVPzDMCDmsqp2yjmdHVEBH2SXVsAVKUX+63nLbgCwfz/wqxwX2LgzHVBIh57PCIR/JOMHe6HefK4sRyXEX3Q2sDRHKSwwaexRJaJW2HV2nzeELuSHCuPAzzBDJwlfJ3baxknwGZeCE2tzmePaGfaYvR5wyFGxeD6/+x8btjFXjUx6hcnfiup+vE4A98eY+hXGMGe5vXPksEkpG1sSKiWPWIqN9hOQJ/E1RPLItqZazvFtmQhWaM3jbMyhn3MBc8mLYtO7lz6SETybk4PycNk3nItI0edBcpPRl2e7QCKI4Bs79uMf7btGlxucHT8f3cZ5ZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaVeUMjiTndMwJk2nYPdqJn/3cllfWdazjl86mMEp68=;
 b=V81zkqLOUwdpJEy4JFi8iegyDsdlPpmZ7fLRBCBsrPCW8uBjhEzI9nFXSwQpRcC8fzFS+PeC/UunNKuep7v6+ZVmIUwDzl9pZggOQnAyYK0d0HCzIjnrF9k/PJa0Dy0wlQrtfTPwCLIE34nYWa/3hV0XJjJZJpevEFlkGxIssEw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6805.jpnprd01.prod.outlook.com (2603:1096:604:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 12:55:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 12:55:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Topic: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Index:
 AQHbZznBkfvGK/9M9kaeTTHwnLvzBrMcszgAgAkPAuCAAAaOgIAAA5vAgAAfvgCAAAGDMA==
Date: Fri, 24 Jan 2025 12:55:12 +0000
Message-ID:
 <TY3PR01MB11346BADEA961847B84D911E986E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
 <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
 <TY3PR01MB11346DC4A22A2EC0CB0DAF61186E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f4cdcb9e-ae30-45ad-87f4-7395db0ab995@kernel.org>
 <TY3PR01MB11346D1E5B190101E7F474BEB86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <305ba07f-e5f3-4d2e-b017-8a817418f16c@kernel.org>
In-Reply-To: <305ba07f-e5f3-4d2e-b017-8a817418f16c@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6805:EE_
x-ms-office365-filtering-correlation-id: deaf9c97-76a0-49bb-764e-08dd3c765765
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUtWd1JoS3djQ3d5VHNDK2drUkFnYU1iOGtuTkFOVnJSa0tpWDlOTm16ZDNa?=
 =?utf-8?B?YXArNnFPWHBwdGl3QXZBam9TN1lsQWduNFk3V1RIdEx6WXNPM28yQU54dkp3?=
 =?utf-8?B?VmZleWpxYWdJMTdXekIySGlXZXh3UktwZDdGM3Z4VkRkSXJNblNKSGVJS1Iy?=
 =?utf-8?B?a29oaGVhK3pTbVVkdjNIVGpCZjNmSVJKOGdyVFFidlJRbWNoa0xyMUwwN0FJ?=
 =?utf-8?B?OGwyd0hyNnpvdStzL2p4R21rOXhYeGdNUGx4aWNHUHdVTlk2MUdXM2JwQWh3?=
 =?utf-8?B?MmFzVUtoS0tUeG94UU1aK0U2Tk5NMDRGQXkrSVpHTlVoT2U3UEdlMk9ZVWha?=
 =?utf-8?B?TmwrZy95Rlc1ZGVmYXdRa2RVaUdOUjFnUFdqQ2VjSjBWWktDN2I2MXBSWWt5?=
 =?utf-8?B?cFBNNFU5SS9kZWRWNTg1bmtXZnYzSjQ2cTBDWlpUMDBLL0tJSnNYOEdqbHRv?=
 =?utf-8?B?S3VBVnRINDBhamV1Y3M1Y2IrblFBZi9oZ09aS0xrR3phVFRWY1BaVE5XaFZR?=
 =?utf-8?B?dU1lc1V4VU8xbVF5ZDVzVWlQdHJmNnhKeVpuREZ0VzhBeFcxeWVURzFNcm1h?=
 =?utf-8?B?SjI3RDZkYWQxSzFCdG9KTnN0bGF5SDREWkg2aStPZ1k0N2NGTC9vMVV2RUh1?=
 =?utf-8?B?cXFoY1BIK1dneTQrYXdHY1U5SmY3MEJzNGNsMGlISktQUHprRU1JeDcyeCtX?=
 =?utf-8?B?c2pNWGd5a3VkMUpEalVnS2dUdXN5dVducXBvMUU5cURXdU44WG03NkpsQnJE?=
 =?utf-8?B?MVE1alpLRWtVM29jZDQzdEIvMnNOZGhOanFLUHRBL2FobmNCUWFDWjlEbGI3?=
 =?utf-8?B?dlBlVWxuc2o4TERTeUpTeSsvc2hRNzczdS9FVVhqRUtnUU1MWUNQR2hjMi9Z?=
 =?utf-8?B?RGpYcjlwbWdmejBIeWNZT0taU0s4cFZCZWxPK2s1dE9HOHE0QU1OMFNRbnpq?=
 =?utf-8?B?OFRBamgvbi9MZ05WNVlNMEFsNzNWTUlzbFhnSHB2cGNWUkxPR244MmpOajVs?=
 =?utf-8?B?eGlFLzU2eHRTQkZ1WVBlSTZ0S0VWSkJQZzE2WWw1bE40Wk1pUGUwcmR2cERY?=
 =?utf-8?B?NmIyYm80NWg4Q3hXNWwya0RNbk9MVWJnaDdxSHNBMmZWendtQWViNXcvUjdu?=
 =?utf-8?B?RTlNOUEwUXZmU1ViNnp2anRMbEZFU2sxbjRKVU05U085Y0ZCNjVxMG5BV3hh?=
 =?utf-8?B?VkJTc1NZamFVN29TOHBhS1Vjd0VMT2ltY3I2YTJsSkVSM3NlYmEwSVBHZHMz?=
 =?utf-8?B?R3FLdVJQSWFYWnQyUDBRVDRPNHppS3RVZFY1bzl6OERkcndPeituVkZIUktT?=
 =?utf-8?B?d0l0dkljYVdnVjlWa1lydjdXZm9OV3FVaU9sVjEyM1dKS2RzekN5b1RsdEdO?=
 =?utf-8?B?MHV5ZzlESEIrQzFSeGlSVXpiMnlVeVhIUDA1MVhCMW53MjNJbU1GdjNtQUFk?=
 =?utf-8?B?ZGpBTHZIRThsdkorOWJGeGJqZmt5TVVucHUzYnV1R2JPazVEcXJHeVZETUZy?=
 =?utf-8?B?KzdvMDZRN2FVajFLK0psZTJkYlZHdThQb2R0SGlJOG5rOUtGUk14RUhXcnRv?=
 =?utf-8?B?bXU2cE1wT2N4LzVPSlFBb2RQWWNrTjl0MW9CUnlyWEVrcVRSQ0E4NGhMcjdT?=
 =?utf-8?B?cVh6amN0SE5wZmlDbVBZVS9oeEZZS2xWOVpSTzNiZjBYbFN1WUg5OFoyK2wx?=
 =?utf-8?B?eTlYVFBZdmd1ZStlaFI4ams4RUd6dFN2RTZHbFlHWGttNzhQbEZtRnhaZW1G?=
 =?utf-8?B?djVkZzFWeFdCbWppSkFPNG1tSVNOanErdzEvc0NlbWwzd29Bckd2dlJNZC9L?=
 =?utf-8?B?cGl1aythL2VCeUlsVk1mWTJneEVLdVFxWlJvUzJwUGt1ZWtzcWlucXI2YjJw?=
 =?utf-8?B?RE9qNTJ4cjduanN2N3R0RExPZjVnaDFHODVIVjZ2OHlVRDJsc0s1aUR5RjMx?=
 =?utf-8?Q?lVi38k7nu1RyrnhRHgWVX7F8Uo5YlMHK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHJKOGxEa2RndjVXd2ZaTS9XdXI1U0RtbEpBekozWWxZQkM1TFhpdmJ3cklF?=
 =?utf-8?B?allxdkVtRlZZN0FqVGhzK2huanhMb290c1dtQmlzNytrc2VZTkVpVmoxUXAz?=
 =?utf-8?B?bWMyWFAzQTQ1ZkRpZmVXRnd1TkNkVGNiM3g0SURqc0REeUZPMWNXb1I4Mnl0?=
 =?utf-8?B?NnFiNnRlL1RHUHZCMVF2eUVHZXZ4MzN0bGVEWndaRFdZZlcxNG0wdHp1S3hw?=
 =?utf-8?B?TWFqZnFqVm80MkJnTXVudmJuckwyZmowZno5TlhhNHJGeGV0R2YvWE9OUkFQ?=
 =?utf-8?B?ZmtqOTJXbTdSZnRHVC9IVUtiMFhHWjk5VWxLSS9TR1ozcWxzYmNIZ0sxUlo5?=
 =?utf-8?B?ZDdSZDUrWjd0Vlo4UFpwR2VhRlBURVprUDFRalBxbWpBT1FLNitBV3hxNUVS?=
 =?utf-8?B?SEtxeUpyODBvM2tYYlEyZ2doNUN4ZWtoMFNUaVltU3pDS296THNhQ1p4Q1ZG?=
 =?utf-8?B?V1ZMeHR3RW11Z0dzSzFNMHlEZkN5MklZK2IvUXNpZzJaZ2R2a0d6dkhlWERq?=
 =?utf-8?B?SC8vZWdlODZ4M1BMTnhZZHI1K0NzMVY1UVhZc3hyU3lmZmlCUThBNWJmVk1i?=
 =?utf-8?B?ak9PcjBONzZ2TVpiMzdlTHNjUzVTR2doZjA0Ty9LWmY2czhtckhlS2VzWnEy?=
 =?utf-8?B?VG1tTXpVVDh1RmpoZC82OHBaTkxtc0Vrb1ZVS2doQXhUNnE5VzJQdzNSYkhN?=
 =?utf-8?B?aDhlb1A1YndoRkxqVnBVS3RMYXdNUnZMS0dEbmFxUzVaNHczaVdzZWhTaUhi?=
 =?utf-8?B?QVhYRUpoZW1uRkowOFVXeUNDZlcxTFRkYzVJaEo4Yzlzd05yVnl3OCtaOW9w?=
 =?utf-8?B?MUNmajNpbWZaK01uL0VHamtjTkNuMUh1aVpVUVN0SkVjQno0czhLdXR0VThC?=
 =?utf-8?B?enlNMzZZaTlhMnhka3MrbTZ0aVRKUGdZS1g0M1pyQzNDb2hqanZ4Rjh1aEt6?=
 =?utf-8?B?cDUwUDdudE1mazg0akdXUDhkb0dFOWNpY29ZZTJSYVNiUktxSnE4YjRjN1JH?=
 =?utf-8?B?aHJHV1JTbTVneWYrVHQyeS9KS29nM0pQM3JFNXdyM1BnR28wcDg1NTE4TTRW?=
 =?utf-8?B?NitTVXVFK1ppL3dJc3QzWnJFSjRFYm1wTU9jeTB1T2tkSFVVdVIrVDExREVN?=
 =?utf-8?B?Wlc5RVQxRWl3b1VSQWp4Y1k3aDJqMER4L0NwNU5WVHltd01aUmFvbisyM2dD?=
 =?utf-8?B?WUcrbmFQaThNODlyMHZZOWpUayt1OVRhUHo4c0psWTg2TFFNbmVhL0g3eUh3?=
 =?utf-8?B?T3AxSTZvSC8zZG9ad1lqbEs1VFRlODFJL2FweTVxV2IrMWdYRDFGTlFyY3dD?=
 =?utf-8?B?SU1kUmw4ZUxQYS9aTVczRkhoTHhuUGdjbnNnVGptVG51alpsYUVKcEZib2Fp?=
 =?utf-8?B?cEZJQTJ5TXNSRit6NXYzMDhjanFuVitlK0tLQ2ZicGJoVTZxMGtVV2doQy9V?=
 =?utf-8?B?dFFzdUVMMU05MkdlWGZiS0tCYTY0dW1hbW5YQW81ckVEUlVwMVNLM2tXcXBk?=
 =?utf-8?B?dllya1BqaGgrSnA4UUh2eEFXc3VHR1RwU2hMdzQ2SW04SVc0QkZuKzNYRUxn?=
 =?utf-8?B?QzcvRnloOFFBZlk0b1hxZk0vdUwxeHFaQWYxWHpmNFdOK2l0TXJPdmhaSGow?=
 =?utf-8?B?N0lBZFh2RXJCeGZnZXJqWVJFa3pFRGk4RzZtd1NXdHB4NmdSZ1BQdTd1QUVz?=
 =?utf-8?B?d0I3dUxNSC9relkrcURxWlZwRFprbHFCQXk0cUh4WGZWbkRma1dOelpyT05q?=
 =?utf-8?B?VzhkYVNJUUcvR3RnZnVQTzROTU1xVmh1MndoOTQ4TmpiOHRyeng5bURBbzQy?=
 =?utf-8?B?d3JVdTY5amkzMVNEQ3ZobmROY1JrUExZaGZ3UWZxN1BzYWdwbXlDZHBOVjZD?=
 =?utf-8?B?R2JVZWdhUlFaNVRyUDBDSTVHY280N1hRSzZxUFdlZmJDM2RuVGxIRDYyWW1q?=
 =?utf-8?B?Y09QMVFrNEdmR0RtYnQzWm5rbUhZZXJkcSs0aVdhUmVNZ0htTGlqTUZPT2pG?=
 =?utf-8?B?M0R3MmY3cXRIVzdlaGdCaDgzZXZOd0FyS29acU53RnorWUdZREJHd3VRVGNZ?=
 =?utf-8?B?LzNsTnl4Qjg5NU91VXI5dUZ1T3JIY01xM1I0NU5IQmJZSTd5cHFnNVordjdF?=
 =?utf-8?B?WEgvNUVXbHhWZnlMYVRpTXpWVEd5c2gxYm9Ia3pjY3VCNWp0Tm1hRFJicFNl?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deaf9c97-76a0-49bb-764e-08dd3c765765
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 12:55:12.6432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qpT5NWnAAd9G+SBkOci0EAa35knRV2FaGdzgpwszt63bqEuaX5i4r3TJH2uQ6Us6sPCKLs0a5uFUAFM60bwBCdsQJ01e4Zc9g2QbwmWzzyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6805

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEphbnVhcnkgMjAyNSAxMjo0Mg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gd2F0Y2hkb2c6
IE1ha2UgUlpWMkhXRFQgZHJpdmVyIGRlcGVuZCBvbiBBUkNIX1I5QTA5RzQ3DQo+IA0KPiBPbiAy
NC8wMS8yMDI1IDExOjU3LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296bG93
c2tpLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogMjQgSmFudWFy
eSAyMDI1IDEwOjM1DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy81XSB3YXRjaGRvZzogTWFr
ZSBSWlYySFdEVCBkcml2ZXIgZGVwZW5kIG9uDQo+ID4+IEFSQ0hfUjlBMDlHNDcNCj4gPj4NCj4g
Pj4gT24gMjQvMDEvMjAyNSAxMToyMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+Pj4NCj4gPj4+Pj4g
KwlkZXBlbmRzIG9uIEFSQ0hfUjlBMDlHMDQ3IHx8IEFSQ0hfUjlBMDlHMDU3IHx8IENPTVBJTEVf
VEVTVA0KPiA+Pj4+DQo+ID4+Pj4gQnV0IHRoaXMgaXMganVzdCB3cm9uZy4gWW91IGFyZSBzdXBw
b3NlZCB0byBkZXBlbmQgb24gcmVuZXNhcyBBUkhDLA0KPiA+Pj4+IG5vdCB5b3VyIGluZGl2aWR1
YWwgU29DIChhbmQgdGhpcyBpcyB3aGF0IHlvdSBjYWxsZWQgaGVyZSAiQVJDSF9SOUEuLi4iKS4N
Cj4gPj4+Pg0KPiA+Pj4+IEdyZWcgbWFueSB0aW1lcyBnYXZlIHN0cm9uZyBvcGluaW9uIHRoYXQg
ZXZlbiBmdWxsIEFSQ0ggaXMgd3JvbmcNCj4gPj4+PiBhbmQgd2UgbWFuYWdlZCB0byBjb252aW5j
ZSBoaW0gdGhhdCBpdCBoYXMgYSBtZWFuaW5nIChvciBoZSBkaWQgbm90DQo+ID4+Pj4gd2FudCB0
byBrZWVwIGRpc2N1c3NpbmcpLiBCdXQgcmVzdHJpY3RpbmcgaXQgcGVyIHNvYyBpcyBwb2ludGxl
c3MNCj4gPj4+PiBhbmQgaW1wb3NzaWJsZSB0byBkZWZlbmQgaW4NCj4gPj4gZGlzY3Vzc2lvbi4N
Cj4gPj4+DQo+ID4+PiBDdXJyZW50bHkgZm9yIGJ1aWxkaW5nIFJaL0czRSBXRFQsIEkgbmVlZCB0
byBhbHdheXMgaGF2ZSBSWi9WMkggU29DIGNvbmZpZy4NCj4gPj4+IHdoaWNoIGlzIHBvaW50bGVz
cy4gTWF5IGJlIEFSQ0hfUkVORVNBUyBzaG91bGQgb2sgaW4gdGhpcyBjYXNlPz8NCj4gPj4gQXNz
dW1pbmcgQVJDSF9SRU5FU0FTIGNvdmVycyB5b3VyIGluZGl2aWR1YWwgU29DcyBhYm92ZSwgeWVz
LCB0aGF0J3MNCj4gPj4gdGhlIHdheSBmb3IgZHJpdmVyIHRvIGxpbWl0IHRoZW1zZWx2ZXMgdG8g
dXNhYmxlIGZhbWlseS4NCj4gPg0KPiA+IEFSQ0hfUkVORVNBUyBoYXMgQVJNLCBBUk02NCBhbmQg
UklTQyBiYXNlZCBTb0NzLg0KPiA+DQo+ID4gQ3VycmVudGx5IGl0IGNvdmVycyBBUkNIX1JDQVJf
R0VOMSwgQVJDSF9SQ0FSX0dFTjIsICBBUkNIX1JDQVJfR0VOMywNCj4gPiBBUkNIX1JDQVJfR0VO
NCwgQVJDSF9STU9CSUxFLCBBUkNIX1JaRzJMLCBBUkNIX1JaTjEgRmFtaWx5IFNPQ3MgYW5kDQo+
ID4gcmVzdCBvZiB0aGUgaW5kaXZpZHVhbCBTb0NzIHN1Y2ggYXMgUlovVjJIIGFibmQgUlovZzNF
Lg0KPiANCj4gDQo+IFJhdGhlciB0ZWxsIG1lIHdoeSB0aGlzIGlzIHN1cHBvc2VkIHRvIGJlIGRp
ZmZlcmVudCB0aGFuIG90aGVyIHZlbmRvcnM/DQoNCkl0IGlzIG5vdCBkaWZmZXJlbnQgZnJvbSBv
dGhlciB2ZW5kb3JzLiANCg0KU2VlLCBmb3IgZWc6DQpjb25maWcgUzNDMjQxMF9XQVRDSERPRyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
CiA1NTcgICAgICAgICB0cmlzdGF0ZSAiUzNDNjQxMC9TNVB2MjEwL0V4eW5vcyBXYXRjaGRvZyIg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogNTU4ICAgICAgICAgZGVwZW5kcyBvbiBB
UkNIX1MzQzY0WFggfHwgQVJDSF9TNVBWMjEwIHx8IEFSQ0hfRVhZTk9TIHx8IENPTVBJTEVfVEVT
VCAgDQoNCg0KNTc1IGNvbmZpZyBTQTExMDBfV0FUQ0hET0cgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KIDU3NiAgICAgICAgIHRyaXN0
YXRlICJTQTExMDAvUFhBMnh4IHdhdGNoZG9nIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICANCiA1NzcgICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfU0ExMTAwIHx8IEFSQ0hf
UFhBIHx8IENPTVBJTEVfVEVTVCAgICAgIA0KDQphbmQgbWFueSBtb3JlLg0KDQoNCj4gDQo+IHx8
IEFSTTY0IGlzIGFscmVhZHkgdXNlZCBzb2x1dGlvbg0KDQpJZiB5b3UgYXJlIGNvcnJlY3QsIHRo
ZW4gYWxsIHNob3VsZCBkZXBlbmQgb24gZWl0aGVyIG9uIEFSTSBvciBBUk02NCBvciBSSVNDViBl
dGMuLi4NCg0KDQo+IA0KPiA+DQo+ID4gU2luY2UgbW9zdCBvZiBJUCdzIGluIFJaL1YySCBhbmQg
UlovRzNFIGFyZSBpZGVudGljYWwgd2UgY291bGQNCj4gPiBpbnRyb2R1Y2UgYSBuZXcgZmFtaWx5
IFNvQyBBUkNIX1JaRzNFX1JaVjJIIHRvIGNvdmVyIGJvdGggb3IgdG9wIGxldmVsIEFSQ0hfUkVO
RVNBUz8/DQo+IA0KPiBZb3Ugc2hvdWxkIG5vdCB3cml0ZSBkcml2ZXJzIHBlciBTb0NzIChvciBl
dmVuIHR3byBvciB0aGVyZSBTb0NzKSBhbmQgdGhlcmUgaXMgcmVhbGx5IG5vIG5lZWQgdG8NCj4g
cmVzdHJpY3QgdGhlbSBwZXIgZWFjaCBTb0MuDQoNCklmIEkgYW0gbm90IHdyb25nLCBUaGUgd2F0
Y2hkb2cgc3Vic3lzdGVtIHVzZXMgc2ltaWxhciBhcHByb2FjaC4NCg0KPiANCj4gT3RoZXJ3aXNl
IGNvbWUgd2l0aCBhcmd1bWVudHMgdG8gbXkgZmlyc3QgcXVlc3Rpb246IHdoeSBkbyB5b3UgbmVl
ZCBleGNlcHRpb24gaGVyZSBmcm9tIGdlbmVyaWMga2VybmVsDQo+IGFwcHJvYWNoPw0KDQpJdCBp
cyBub3QgZGV2aWF0aW5nIGZyb20gZ2VuZXJpYyBrZXJuZWwgYXBwcm9hY2ggYXMgbG90IG9mIHZl
bmRvcnMgYXJlIGRvaW5nIHRoaXMgd2F5Lg0KZWc6DQoNCmNvbmZpZyBPTUFQX1dBVENIRE9HICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IA0KICAgICAgICAgIHRyaXN0YXRlICJPTUFQIFdhdGNoZG9nIiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgIGRlcGVuZHMgb24gQVJDSF9P
TUFQMTZYWCB8fCBBUkNIX09NQVAyUExVUyB8fCBDT01QSUxFX1RFU1QgICAgDQoNCg0KIGNvbmZp
ZyBEQVZJTkNJX1dBVENIRE9HICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgdHJpc3RhdGUgIkRhVmluY2kgd2F0Y2hkb2ci
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAg
IGRlcGVuZHMgb24gQVJDSF9EQVZJTkNJIHx8IEFSQ0hfS0VZU1RPTkUgfHwgQ09NUElMRV9URVNU
ICAgDQoNCg0KIGNvbmZpZyBLM19SVElfV0FUQ0hET0cgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgdHJpc3RhdGUgIlRl
eGFzIEluc3RydW1lbnRzIEszIFJUSSB3YXRjaGRvZyIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIA0KICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX0szIHx8IENPTVBJTEVfVEVTVCAgIA0KDQpD
aGVlcnMsDQpCaWp1DQo=

