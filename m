Return-Path: <linux-watchdog+bounces-2723-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190AA12996
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 18:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB0C3A713F
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 17:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BF070812;
	Wed, 15 Jan 2025 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ey8laRwZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868F3C47B;
	Wed, 15 Jan 2025 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961489; cv=fail; b=SYjQ7fQlwwtuQqh206B+083W/2DRA2gWAAewzIZUK0PcZE+kEPM43mx3o46NwbJv3KZnRCMmI3aIYu89f8laA1mlLzZW0lyUmnJVMCNhW+lSA9KF1cTO4rWBeHno7/v8Dt+XvoZwIxkCmKAdMxTGS8UHZy/UjMuqssHBAkNi8xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961489; c=relaxed/simple;
	bh=u3slTDt3VNVA8m5MA3F8KsMWXuXTkTX0QNZRkavkPTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oKXU74TbCY+CvTyH2MxGxUbm5gt+rw0c9yq+18otdl+motIkNKmoMPBsVJ//iAwRSO/YRI7vfQIPTt8ObnmzuO2+rWg+lUjPVSehqGW4gRqdSyLjIq3nzMmS/tL9McQlnB4dI9fuf8iSxrKdSNvBtB3Av3AcjP3x7Tedai8SNIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ey8laRwZ; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKZ6q51q6K5Wf2GpP5le7pbadYgwZqq71Fn9zqQbHBERvlW18/vqjz/HDKct8AfWpIPqNz4tQBV9ox0Qhs6Am6NGXrUdM9I2odjpUdv5iVatcT7ylMSEfZybxnalmefOjtdEYTrYgyXXFZJiaNOXvkVYaRTFzjaSEG5koB4+5eR+WAji01aKZrD7QCTGYfXFZL5VsdllcmUW8fZYf7345MruXsMca441MP0Pr75Zy+Ms/rE5gVJgzcxy1vNF9VvdkZ8I0CVmnktChW+Ndmzvf+/rDbhIVwE2lGaB1ZPmCZC6H39KiXY4Z8JVoi+eJPrMD3Gi6bRxvm9ssR+nvzXITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3slTDt3VNVA8m5MA3F8KsMWXuXTkTX0QNZRkavkPTQ=;
 b=GOZXTofRDzIk3d0wvULSaEQNtHGTP4ClZ5S9vDXfDzsJyfJl2CB22+fuslMXxn1K6KBx8HsVCdOLEL8jBM4BGWsI3NTXVDKV4zoWRVmakQxDU2pMgMg7EKx/Rk0oSJot4VTREND9zvUnZHXvSN6iM6RgGe8VO2YDbFW3UiH3khCNiRuAH0wRevq7px7t5z/BiMArqhXiXSaBBM/VITOxfI1516nwNKbigNdXh3ksc/cbQOCw95EdTrGUUjdzvrUszHI408yke6Qb0gbnq15E8KF9ZwLYi8bqAaPS+8kOxwxEIsiTR+c2P22w9kGoqdTW81XnpOjVe/plkEHz8km1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3slTDt3VNVA8m5MA3F8KsMWXuXTkTX0QNZRkavkPTQ=;
 b=ey8laRwZCh/5nzJn2of2ryzTBehZ66Oms8Ld5xiblICA68mkVZHxh7QJO/NX0JGytWQaKPsm2QcdhRz7EMvwDOtmNpz4sRWDicqVk1WX4ySIRT+o2Kh6bqzAeHtv7HGLwk1puWJUyRZnnW6tXaowgUoemdt/SviOSXzaJcof86Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12451.jpnprd01.prod.outlook.com (2603:1096:405:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 17:18:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 17:17:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Topic: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Thread-Index: AQHbZznBkfvGK/9M9kaeTTHwnLvzBrMX7ImAgAAnWJA=
Date: Wed, 15 Jan 2025 17:17:56 +0000
Message-ID:
 <TY3PR01MB1134639C3CBAEA08936144D2F86192@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
 <de74406e-8554-4179-9d1c-4467d8c92645@roeck-us.net>
In-Reply-To: <de74406e-8554-4179-9d1c-4467d8c92645@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12451:EE_
x-ms-office365-filtering-correlation-id: fd2b63fe-9804-4686-1904-08dd35888d82
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUJqRVlqSnpwbnBJTS93blpyYWhZS3RPNkZMTjl6bGJpTUhyOWx6S1Y0RXU1?=
 =?utf-8?B?aW9Vdm5NN2VNRkRibDAxN2l0QlNvQ3RFQ2U0dFQxV3ZRQVJqcHJWN0J6SkpT?=
 =?utf-8?B?T3RzekdMblRoSmpDbER4dEpQUit2WFQvUWF2SDVJRC9sUU1vNGFnZEVyMWNp?=
 =?utf-8?B?eThTV3JDUGsrbGV6U2lZcVFEdDd4d29HTXREVUxvUzN1ZTRNLzBBbzFDMjVl?=
 =?utf-8?B?YzB1enl0N1FvbkZrTGhManF5enpzN1dJcEhMSnlTc1p6MDlMdk9lTExwWnhM?=
 =?utf-8?B?MTdreVV1MFdWTmpQNnpUUmpGS3dESVc5NUJoaUFwVmQyd3FJQjNpcUhNdCsy?=
 =?utf-8?B?ZDZnSytseUZDUVlLOWlxVjdISzB3dWZEWnA5TDUwamYwam9JYnc2MUZNVy9H?=
 =?utf-8?B?dEpSS0RPVHF6Uk1ldlVuVmI0dFFXK25KZ2k5TGFkSjM0SmhxeXRwN25ldU1J?=
 =?utf-8?B?eDBnV3RnS09BeUFZSEdocVV6RENjb2x1ZTllWWcxbTdSb3dGcTQydE5rWXlT?=
 =?utf-8?B?UVhYRTg1RDhhZ1ZXMXRkR0xFbktNZVE2bWQ1UWVmL2hPSmtXVGl0K1FRb21n?=
 =?utf-8?B?MFY0YyswUjg4SEhuclBHcDdrdWVzbTV1WkdBNGp1cS9VbDMzUnh1V1p2cGFx?=
 =?utf-8?B?Q09ZYnlCbGVwUUhoaVh5bkxxT1Vob1llY29oZWxXNnRpekZwWWlVQzczOXQ2?=
 =?utf-8?B?WFdObG1yZCt6T2MzSmpVOFFVeSt5cmVWNG9pa2ZuK0NMLzVUVys0REFyTklD?=
 =?utf-8?B?MFNRY29ySGZmSXI3ZmFjNkZkY3EweFZ3WmN2ekc3Q1JDeXNqZDltYXZIaUxm?=
 =?utf-8?B?KzFWQXBnbTZGemNuL3VJbnJSb05IVytRQzdHdjVQbURUdW1NNXRsMHZVd0NO?=
 =?utf-8?B?MVlRRlNXbXYvNVM3NVVQejgxQmFrSUJnVVk0TVVsZEdiNVoyYmNOVGpOQWdW?=
 =?utf-8?B?TXZ5QTJtV054T1R2UnpTdDZrZFBuVFZrdmVVeVV6NEdPKzNRSWllNlkwM0dD?=
 =?utf-8?B?MEpRWEZMRXpNNWkvT2dPdkZSeHIwSjJiMkxxK2NFSXgzQlROa1lsYzFzYnVi?=
 =?utf-8?B?Qms3M2ZnUVY1VkdFb2hieTdzVkJ6TlMrZW5JTnkwRFl5b29GWlloZEtaTndH?=
 =?utf-8?B?TVFydW14c3hBbW5ZbURQYjJZQ1UvcndGVGxHQTF0TnlkNm80TWVCSFBCenZo?=
 =?utf-8?B?cmE1TG1lWk5kbStEM0gvN005SkdncVlwMXIyR09JSmZnOWxPaWRqOFljVytV?=
 =?utf-8?B?TVNPWDhST2ExUm5jcU1GMldNaTJyclB5OGV1WGg1M2xpRlU5WjQ5UHhQbTYr?=
 =?utf-8?B?WHFZbG5QNi9oNFUwUFREaGN6d2h1VHNhNGhsa0xxb3RJSDFtbHVoWGdQSnN2?=
 =?utf-8?B?L3RiTTFOY2pmdUZRNzczMjhMQm1LbEs1Vlp6dHBqMGd6R3IxQWRlbmE0aWh5?=
 =?utf-8?B?RUZEbkdLUFNmZDRZQU1XRldoVFErQjMrTVFJbVBkVkNFallyQk1najk5YWxS?=
 =?utf-8?B?YmhpSitYam53QnF5ekdob1VjOGVUVTFWeGdkOGduVzQ5Z0VWWHA2K2piVThF?=
 =?utf-8?B?KzNBa3Nwd3pUSFowYVk5bU9BZ3FCNTZZcU9WOGwrRFdCeUc4MUM2MVBYc1lG?=
 =?utf-8?B?SEx2TXRQZ1ZYYmdKU3FiWlZrNFlFM0o3dWJCa1VmT2NJTElUZndkVW1CVG11?=
 =?utf-8?B?aHp3V3pnbmttTDFrdDlWaXZVWjhrK0tyV1RWZ3ptZ0N6YVEyS2llcE9XRnBh?=
 =?utf-8?B?djltMTVXZCtxSDZVaTdLRFYvVHR3Z2lZdk1NM1dBcWxYU1FvblR6aDBpdGRa?=
 =?utf-8?B?Y0RvWXZjRDNFazMycHQ4ZlllODZpcEdmNXFYSE94VkNaZmNnWHJ1RGg4clhk?=
 =?utf-8?B?bW1oY21UZXNCU2VnNnRuNThIQWYzaHkrWUQvaXJ1cFA1bDBiOUJGbGVBZFJO?=
 =?utf-8?Q?qVLHOWVmzRLdHj1x/vevBtHNgRNj5DMd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODlMeXl5R3gyNVcvK0wxL214dWp6UjVuWUp1OWk4S1ZPeFF1d1V6NzRqbG96?=
 =?utf-8?B?YXRScithekVYODFzZ3ZEOW5yRHFwa2Y0THpVVzV4dG1FeHlLSTc0MnhOSlZP?=
 =?utf-8?B?L1B0dHhBYUhEQXBjejNseVBLcFl1dzJvdy92RXMrUkwxNXRValB0Qi9JZlVv?=
 =?utf-8?B?aHBPZmJPUi9NZ2R4ZEllcHkrZ29yc3JueGV1YUxUVWpOQTVxYmFTYVU4QXdw?=
 =?utf-8?B?ZEpPZXhmVzA4RUpPOGtiZGNMbnBuZnJaUzF4UTJyZkZGWXBXY3hNSGVvWlRW?=
 =?utf-8?B?VTRiZGROdXlmRGNGdm5CYmZCQUNiWUdER05EUVFwYlZLcjJodTV0NWxWdmF3?=
 =?utf-8?B?aGRCWGFyWDVzcUg0M0RLRmVubEpRaXBIQTVaMU1qWW1GRU1hYWxOTi83Z2wv?=
 =?utf-8?B?UVZobEF2UEJPWDBvMjlXcDFwbTBubFp2VGVDZWVIL1BERzVyQW9VZldBMDdL?=
 =?utf-8?B?VUR6RU1BdW9kTW10TmlHRjlNSXNVd2ZZcnQ5bXJvNExLMXg5cFRmNGR1MmF1?=
 =?utf-8?B?RFl4bXRiaERkSTMwTm5rRjd5cUR3WDdnVXduZmlqZjFSK0dTSzFwLzhFUlho?=
 =?utf-8?B?dzR6QkdpUTVIWFp4ZVlTeVpJbkxOOUdjRkt5dER0WlowSFlFK0laY1d5VjlB?=
 =?utf-8?B?Yjc4L2FXWmRZcmh1YW5lY3pOZWN2SFU1Ukl2TlppckxDNXoyMmJ5aHpQTEZx?=
 =?utf-8?B?U2lVbnA5RksvL3JLL2FKS2dCZ05rSVhuWm01WjB0Q21GREIzNFd4eTZxN2FF?=
 =?utf-8?B?dEVlaElJSHdyL1ZjSnJ0N1F2MGw4ZHZhdXFZaFdhOXpkVlhoVTArdGJqZlgz?=
 =?utf-8?B?L2VrV3BiOVVTb0VoSEUzRnVPUHNFV0NhSnhaZjJueGs4TkxORG44WFI4bHl2?=
 =?utf-8?B?N2xaMHBoVy8rSUdhVmpkY3hXSVdhbEk3Q3Uyem9IWFZCR215bkk3RUdFa0xR?=
 =?utf-8?B?WGFSVHovNXhNRXZrS1QrUVpwRWtaa2VwYUZmSUZabWdjS293ZmFlTkllY1pG?=
 =?utf-8?B?Mm15elhIZk01L0s0VlRCWUw4YXJJSGpXdDBranhsZzZkVUFMdkhUaXJWM3hN?=
 =?utf-8?B?TkxsQUxHM3dIZHlRSEhnY2pnZ1F1SHhiZncrOWJHYnBaUHJrcW01ZUV4Mndh?=
 =?utf-8?B?QmFPN2NkcXVNdGpYVFVYTDFqcFVidGh0b2dVSEF2UnZIQXE3cG9FS3NQRndW?=
 =?utf-8?B?Slg0MHptMVkvNk81TWtlUFFGSDBMUG1ZWDNiZ1paZm56NERSY2FOVmx3dkRv?=
 =?utf-8?B?dGs4VlNHSnQ5WDF2RnNWWGJKQkJ4aVh4dE9DMHR2NlErdXZjV2QvVHp2RDEr?=
 =?utf-8?B?V2FqVEVWV01MZGhyMmhzSGs4dmZseEVySXRUcGpuc2NpUHhmbzJtalQzVFcw?=
 =?utf-8?B?cmE5dGRxUmRPaTJxNktHeHJ2cFd3ZDlsNVpZUGlDaUdudzlxQkNkd3puYWFV?=
 =?utf-8?B?aFlXbUVQZEx2VCt5OE9DeU5xS3I2SEtpMHlHZHNhNWdtbk1mbldBWHJsaDZn?=
 =?utf-8?B?QUY5SUR5ZlJvNlcrcUtjYnkzaFdPbmhCNHJ0RkdQMlhHLzZIVWtYbEZhWTB1?=
 =?utf-8?B?VVpVektPQXNQNDdQWVgrS21pSisyVFVLaEtwa2ExRHAyUlIvdFN5TmtqR0Rp?=
 =?utf-8?B?ai83UlpTODJCOVRFejdNWDV2dXZpZ2w3c1N5dnlqcG1tWUpWbngyWFdwOGd6?=
 =?utf-8?B?MmIzcW1ndTN2cVg1QWtCL3ptMmhFS2o1cWNjZFRZbUI0bUN5UDlQMUlqU3Y0?=
 =?utf-8?B?MXJpdzhUSDh4T2N3RzRWTnZQWEx6UUhjVFR3S0dzUGI3VWxucXBISmthVlJW?=
 =?utf-8?B?SG9GY3FPU1lYY3BrMXZqNTF5WEhaejlzUWo3OWtONEhBRjM2bjNSOXNvWk9v?=
 =?utf-8?B?T3pwM1oxK0lkdm43U05raVZmaVZYMWhoNzJDWUJGL0ZYOU9GTFFyWEgyNmlX?=
 =?utf-8?B?SkJST1lRdkhLVExjc1J0Qmx1c21BdGhjb2RmTDZvWFU4dUx3ckIrZHI5SS9i?=
 =?utf-8?B?ZTA5bmR6QmFxL0ZHaTBKSDJWcW9GTm83RnlGVnNDbENuejFjbEY2N3hyaldD?=
 =?utf-8?B?VENrNnJNQzJkWElTREE2ekxoZHU1b1EyK0xYV0I4QzlCWVAzTTJpdVBPTUNk?=
 =?utf-8?B?eDFNVnFhZWpScThSQUxVYUZMZVYxeXZ5VWYrYXRDaEJsRFh0VjZuc0dYS3JW?=
 =?utf-8?B?S0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2b63fe-9804-4686-1904-08dd35888d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 17:17:56.2307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwT1qp926yo15c4CsVshjMMKt0JEa/Sx/Ivp1mHdk4X2zdsGEvSBwdMS0muL9WKDmiqGj3CueUuQoF4pLSJci73BYjmrCcwwyib3qjEoFjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12451

SGkgR3VlbnRlciwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+
IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IDE1IEphbnVhcnkgMjAyNSAxNDo1
NQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gd2F0Y2hkb2c6IE1ha2UgUlpWMkhXRFQgZHJp
dmVyIGRlcGVuZCBvbiBBUkNIX1I5QTA5RzQ3DQo+IA0KPiBPbiAxLzE1LzI1IDAyOjM4LCBCaWp1
IERhcyB3cm90ZToNCj4gPiBSWi9HM0Ugd2F0Y2hkb2cgdGltZXIgSVAgaXMgc2ltaWxhciB0byB0
aGUgb25lIGZvdW5kIG9uIFJaL1YySC4NCj4gPiBBZGQgS2NvbmZpZyBkZXBlbmRlbmN5IGZvciBS
WlYySFdEVCBkcml2ZXIgd2l0aCBBUkNIX1I5QTA5RzQ3IGFuZA0KPiA+IHVwZGF0ZSB0aGUgaGVs
cCBkZXNjcmlwdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoZSBzdWJqZWN0IGlzIGEgYml0IG1pc2xlYWRp
bmcuIEl0IHdvdWxkIGJlIGJldHRlciBuYW1lZCAiRW5hYmxlIHRoZSBSWlYySFdEVCBkcml2ZXIg
Zm9yDQo+IEFSQ0hfUjlBMDlHNDciIG9yIHNpbWlsYXIuDQoNCk9LLCBXaWxsIHVwZGF0ZSBzdWJq
ZWN0IGFuZCBkZXNjcmlwdGlvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg==

