Return-Path: <linux-watchdog+bounces-2207-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 510AA99C692
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 11:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ACBA1C22799
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 09:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323AB15687D;
	Mon, 14 Oct 2024 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="SN2DZ4Um"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2098.outbound.protection.outlook.com [40.107.255.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81B145B2D;
	Mon, 14 Oct 2024 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899946; cv=fail; b=H5k8i9oNTVKee082R0cUx4Hvvi6bHosgKwBuEnKGYOOoPfbvMK8U7eeo7UqtIgA6ZP7PcCbp4KvD9bjlLoJoadqcT93laWW23tJA82P3deVWhgzdoO4Q4B9rdc1ElpH1ARux/hr7Hjjki9SyoX6A9P2x+8JpRiu0s3gQsr+JOuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899946; c=relaxed/simple;
	bh=DgYCRy/Se5vcMAXjTPul/kFvfVX7euoMrHsx5kAwaCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F1evRngK+UKDzck7Qpo0+KGZmT7qcpdj12XHHLkQS41Eisx7bCTnXUuWf+g1jlXhxGYHp+7PILHKqTDiNMGD/rRS/coAOKIeEpYQTlvtUJyPaC1kBheZLrD9QatdMejW7HGMH3PRRBcNCkiy9kJa49st2v+8SF+JUzEn/tNkLDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=SN2DZ4Um; arc=fail smtp.client-ip=40.107.255.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gID6buWhFRFyID3ZTQZNzhWtlITkKJAFTusSEb2nGVlblWSjgvMfg9KznotdjASIAD0IO0aC6VNAJfimUtyhv1ro+MtTUGXwYdBI0G8T9X8o7OFpcBThISaO5q9rXG1+zRmOF4Zy9ASMgtA8hYOJD30cknBg3Ad9INcINAzLUi3qxdz70rgxDOZftG2qz8l24Dqmhzj7TIfUvbLH5VxasO0uOG47LjvEuD3mwAydA2CATKLMZ3je3OZOfQsOe3mjDzbmCmJJkavq1Jf2gUFfpSCQ0oMT2aAt9URU+WRL40/cCfuhDtZpiAWavv/hZL+JhCWcKxXYo3YRAGHEa9VrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgYCRy/Se5vcMAXjTPul/kFvfVX7euoMrHsx5kAwaCg=;
 b=RsaQefWNVc5oXeXX0pRSgV0pxInGkfLyMJhteiX4vnX43p8MLLIWfTU7JfIiQLwEsEtaXMG9vgMJZKLPDX6kZEtiol9KGuXurkC5aKT7P+MXTug6cFfw45OcNEII7IcV6IyU8SDuD8+CXY7Lxq3K1AeouixDEHz9SLlovnPKJkSPpYuPBiJj8GlPPnZrUetBCq5rqbEs4Wy5Dcj1ZwTklvaw9/jP4mlwfmz13clgXQ9uPZj3LX9Kdg8Y0PLJb19Hoy7QZclAm6rIAZ6dD/5WKj+jNtWoYQ2oU9kJV1a0/pNCqCIoXEyjPmOMFQY+t+VlV41cnNRlEcAh3+Hh094zDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgYCRy/Se5vcMAXjTPul/kFvfVX7euoMrHsx5kAwaCg=;
 b=SN2DZ4UmrfmxMvifDk/rP343JENVwRT0TOJKQbM0SUPRuAQNGCcgAjp135Jd2r092+aFREyU90/fyHxfuMx2sXVeYu9CwYptxI6du7WVfm6aHJ+wx+K8CAmT1Gd8XJ1hK7OdNlqeYOeCmZYylJu15p73Ed1RHM2f3wvyW/uJZId2JD0VbdXQx0ptxi28fy4clJorFgi9OZoklKKSWlV6G/2MK6kUcExuGymL7/5YTefoUw5Y9U8d/3UMep+wp+wDQpo9v2VE5yRhbkOanBtk4iczIKcAF7MOd/i2UgB0b061V2Av8RuEKN4HvTkWeWgCQEuz7NgQKFTNEqNWVw6+HQ==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYSPR06MB6504.apcprd06.prod.outlook.com (2603:1096:400:477::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.15; Mon, 14 Oct
 2024 09:58:53 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8069.009; Mon, 14 Oct 2024
 09:58:52 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
	"Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
	"Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>, "DELPHINE_CHIU@wiwynn.com"
	<DELPHINE_CHIU@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>, Aaron Lee
	<aaron_lee@aspeedtech.com>
Subject: RE: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Topic: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Thread-Index: AQHbGILwQgrDNDHU9U+K+QITBzViybJ625kAgAqiwiCAAFwqAIAAMhFA
Date: Mon, 14 Oct 2024 09:58:52 +0000
Message-ID:
 <TYZPR06MB5203836945655EBFF667417BB2442@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
 <6bb599b4-141c-43a5-8b9f-4cf6ca6c3384@kernel.org>
 <TYZPR06MB5203B274C68C34FD478EA162B2442@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <e53369a9-c205-4297-b151-7a1e61d8459f@kernel.org>
In-Reply-To: <e53369a9-c205-4297-b151-7a1e61d8459f@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYSPR06MB6504:EE_
x-ms-office365-filtering-correlation-id: 204d07f9-443e-4a33-00ab-08dcec36cf0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bzVrVmR5WnBQVVdKamdnbEl5WHZlRDJUbUhKRFdLVC9RZVp0WlIzLzNlMnhm?=
 =?utf-8?B?UnFhd1g1b3ZYY1gwQVJ2WW4zalU4SHJEbTBGYWRud05TQkxaekdYazRQeVh0?=
 =?utf-8?B?Ykg3cllZRkxqckpwdVQyaUVBSUQvWGs0KzZST01ZOHNHZU1iUzM3N29JNElX?=
 =?utf-8?B?V1VMNGs2dFdkTHZsbXErUnByZTNHeVFWQXZJVy9FWlFiYkYvclBDOXlHT0ZX?=
 =?utf-8?B?a0cwaFdJNlFzeE9SbGFSeHNIRnNaeDQrWm1rTXAwNVlLRlk3SWJLeEFoN1VG?=
 =?utf-8?B?MlA3ajF2cW54TDRzMHBPVzg1WnpaZnNybFp5SEwrbVQrK25BVFFETlRxWjdP?=
 =?utf-8?B?RVNIaVhFZ1VKOWl5L2x1a2VraEVKVW9Oa25TZ3lhcmRYZmhyeGdPbk1SSHdr?=
 =?utf-8?B?NWgreGlKaFF3Zi9BVXFXQ2ptaVV2ejFGS3V1c0xZd1hSOURjc0NzcTE0clVN?=
 =?utf-8?B?MHBwNFJTT3ZPTE9xMzRWRlFYd3J5TWFiUHFBTWJ1QlR4N2JHeitqblcrcUl1?=
 =?utf-8?B?eWNpdlZFVHZJMVVLYVBxZUFrcUpUQThQN21qV2J2OHVRT3pmdXUrSUdjckRI?=
 =?utf-8?B?MEdwakZMeU11S3FoL1hZbEtaV0t3aTFRc2J4WWFCN1MwWHRuSkJER1pnR2gw?=
 =?utf-8?B?MHA0OHdzNEJTWDlFb0VEd3doeDUrTENlNGZPT1d2dGRFOW5Fa3IwSU92NE1m?=
 =?utf-8?B?bzlMTGN1YkZWWU9uakVuSWtwNy9jallyZEZzRFhRN2pTcmRoWXgyQkVYUmUx?=
 =?utf-8?B?WEhybytDQjJ6QjdxQWUydGhnUHJTcU9pbXpHUnkxbzBDbVlwRXR3VjF5anhq?=
 =?utf-8?B?S2w5eFk2VlM3Sjd0RFlsTGdqMkhNeWZxY3dGdk9IYXlvVC94bnF5amlkbVZh?=
 =?utf-8?B?TCs2Sm9JeVpSa1FTMkhaY3ZrTHF1THRqeThjL2xRTHRpYTFFK1FJU2hJZ0ho?=
 =?utf-8?B?bXlSMGlBWFB4azl6NVA3ZDdhcllDaWhJc3ZjeEhtNDdRUWFmdmtPNDBzd3Ux?=
 =?utf-8?B?clBOSSt3cC91bG5FSzNYN0U5VGFjSnBkMnBlSmtNekdPRnhqdW9vMlc1Rk0v?=
 =?utf-8?B?T3BHbTNROWFsWG5kbWZuemd2bVRRR0U2cG5GRUJybWpxRG1ESml1ZkNCQ1ZP?=
 =?utf-8?B?REw3UUlNMWRXVlV0THRWZmZPY3U1citGRU4wSWExc3c4TytZZUR6ZndkZm9Q?=
 =?utf-8?B?VGIyYllsV3VaeDJEMGpqSGw1Mjhxb3Npd1FiaTdrZlV2aGc5NSt6N2paU0VM?=
 =?utf-8?B?ZHRFYmhydGN4QndZaGxxTkZSbWFpMmxDNC9lSGhGbWhFSURDQXlBd3BIUGNn?=
 =?utf-8?B?UkxsWjgwN1FTOW9yUEM4ak55N1A1WktPZEdsMzhLdmxRZzFIYmhGRzA0L1la?=
 =?utf-8?B?RWRKOWdVZ00vUkx5dTZXWHRwZThVVnZuTHYvOUhhVW1aWG9kSEhOL1JHZWVW?=
 =?utf-8?B?N3ZGVUdkWGlpMXhtTGVVWWY3L1I4RnRteDRxbTlkakdsaFFqbnQzb0tPUTN5?=
 =?utf-8?B?aG9RKzF1SHRZQmFQaDZKVjNPb002UFh5SVdFVUV3SVNpdE1LQjVOQkxPd0ll?=
 =?utf-8?B?cmVaYkh1ZndZYnNCVXpvRkxXTG83TzVGcXl1dE1iUE43YkxoMU1GNkRmTFFI?=
 =?utf-8?B?YUY1UVIrN2tGQXJrQVBpaHpxa3cwZHkyZE8xZUVHZHg4Z2V6L2syaGVacVRh?=
 =?utf-8?B?czZRK1lnK3lLcGxTNzFqb2ZiWUU3MERpcGxNZkRTVlFWOXJDTkJJMWpoOHZX?=
 =?utf-8?B?aEs2RXBDcWxkdWZZZXUxbG9LLzVWdllNbGtqSmRpVXdGc1JXc2d5VDl0dEtX?=
 =?utf-8?Q?k5u4blVna5KISQkbKaQVrpoOMfHUd3Na0rK8A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlFPa2F0N2VtbWo0aFFoN1loS0lWaDZFNDRRaG5kdU56ZFl3VGIyaHFQakxi?=
 =?utf-8?B?elZYZ0ExVkE1U0Vkb0xaV09Ma1V2bmE5eDNxMytHM0lTU0IyTnN0OVVnalFI?=
 =?utf-8?B?QkMzTWVMSjl2TXE0U0hEeVpucG8vdjc2d2xrYkEwSkJZRll5OUFCaGVhUDVU?=
 =?utf-8?B?aDBFQTE4WTlTazNXcWc3SEtqOGtIWUZTSnpXcXdyb2ZocXBkeHZwMytxbEpT?=
 =?utf-8?B?bG9rWFNsem1ZSFNuQ3J1Z04zZG1zeExra3FuY1BwVFdBWFhGT2hnOWVxTFc3?=
 =?utf-8?B?YXVnVGJZRzF4andwNE0zVHZqZXBiclBjOXNRREM2VE5XN3l6YmFzeVRJNE1a?=
 =?utf-8?B?V2Z4OFBOeXpMVEZXeVN5T0hLWHd4cWcrMWhsK3JjcldxSUc0WE1DWWZFRFJk?=
 =?utf-8?B?Q1hVb1ZzUUdhTVRMRFBZbVhBakxVU3U4ZlVuYzJTNUQxNFg3Y0p1eTF4bGFE?=
 =?utf-8?B?TmNQZFNFeEQxLzJZalF2OWNYZm1Pcm9nOHUrMWNFeWFUWXFaWWlBRHlRVk5F?=
 =?utf-8?B?WlFRZ1Q0Z0FBVHNXTzQ1UEFBVlZVcXA4TUhlQTFxN1VuVTNKdDBITi91WmJq?=
 =?utf-8?B?dkdSYkxKRERuaGZIK00wWWQ5djdSL2ZLZGhWVTVmY0Mrd0R5cGdwQXllN01Z?=
 =?utf-8?B?RlNqL09mS1NRTmRJTTdXSFVobHJxNFlqRkhNbmZLQ041d0hXVE9Da25YQWcv?=
 =?utf-8?B?ZzA2M0ZFZ3VBN2RhM09Oai9OREgzcjVTcEt5WEhvUkVqN09RWG85RSt1Qnpa?=
 =?utf-8?B?Vkx0S1c0L1Z4aUZKMXhpVnZjNUZMVjB4dHl3VzNqaTFmQ0ZpMm14V0dLeDNT?=
 =?utf-8?B?dk13YkcwaVpTZC9oek8rd1QvVlAyaDZzcG1XNlpTbnBqYURtU2RtdmU0a3Y2?=
 =?utf-8?B?TzBRckczNmR1K0UxdHpvZWx1REtFUVMybldxUFpKR3Q4UGVGaXhnNzBIdTVr?=
 =?utf-8?B?UktJREtQOU5iamdlaXZ5blg3Q2lSenM3SldNcThmTGhiUDJJVElRVHZMME5x?=
 =?utf-8?B?MVd1dTR2Y2lnblN6cHp4Z1BtU2htWksxcXgrRzR2L2M2eHc0WW1pU3EyVENV?=
 =?utf-8?B?T0xvbkxweGJ4dTRDT0g2enM3STR2bTBtN3oyd0lISW9Ta2I1aG5ZbkE5eUFj?=
 =?utf-8?B?UUV5eGQ3SHIyNkRqbnVUY3A1ZU9nQ0QvMGUxbU9QQkZKNzhzM2k0dEFlcDJW?=
 =?utf-8?B?L0pLb3lMMlFzcXJxb3JycHp0RWd6OHJkbzJjdFVrcGJYdytCQjdpUU5ERjJm?=
 =?utf-8?B?YjBoWkQwUllMSVRBVjBnOXhQaTZmMGoyR0g0aHNLQ284Yit0NUZJTkl4bk1h?=
 =?utf-8?B?WS8xMi9OaHNoLytyTEJpbUhjb1RsMDM5cDcvbWRyUmF3YjF3dVdlRklRK3Bo?=
 =?utf-8?B?RU91UXFUdDkvNkpIeXMwR05MdkE1Wjl2dERsVkd1TS8vRVprU28zZDRSN0Nn?=
 =?utf-8?B?MmVDYmt4eXFqM3dXaWZBWi9SMFVqQWZBdWJ5Qk5BMTJwUGtCQVorclpLN1Ex?=
 =?utf-8?B?VWVRdlZOVWZ5Y012SFVGYzRZQ3Q4MXNRa1c4aWdqOXRVckJmdm1DMUkvcnRm?=
 =?utf-8?B?TzJ2cjg0NHhsSi96SVNtVWJ6anN5UXd6UVJYMTVFdnhBSU56aVp3aXRKMStj?=
 =?utf-8?B?Z3I1TGpxNnBJTmdHWWxJc0RySFlBUytXOFNaNHlmbkhIS1hZZlRFT28rZHVG?=
 =?utf-8?B?aFNQQUVNSzlPbU16YXdLRDZldk1nemxtK2JyamZwcDhnYTRSMXVYL3cwSzJQ?=
 =?utf-8?B?NjRGN3pQRDJTVENXTnQ0RzdnOXBZQ2MwQktkbmZoZ1R0anRKYVNIbFlhN1h5?=
 =?utf-8?B?OEorYUdRbS9FN0dXUmxTU3UwV2tFNzJITGFGcmhJcGd1Y2VvbEo1NGNqNE45?=
 =?utf-8?B?Sjc2d09QdnZTdzVoS1dRTE1aeDQ4RkhhQVdjNEtWc29PSTdjZ0tzQlovQVBr?=
 =?utf-8?B?RVlBSGRGcS9mL1I5ckVhN1pXZkdpRXo5NndDTWNrTGZOdHgxK05lWVdzU1pH?=
 =?utf-8?B?QzVGeTl4YVNkaHQzQ3FnaDVCb24xUXFMR2lwR2NmVVExeUxYMDZnMEFGTnh4?=
 =?utf-8?B?RllLSjZodExSRnk2cjdIUmF6QkRtYzBsK1BoaWY5Zi93ZStUWVd6czlRdFBX?=
 =?utf-8?B?bTI1WklwOFFNbzBIMkEzM3plNVlWQ0ttTWlSVzZOekRIbmtZWDdBUDZsWUlu?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204d07f9-443e-4a33-00ab-08dcec36cf0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 09:58:52.5282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtdWRD6PEACKLysWiZ/ks5y6+1x4i7qnQYncN7wrHi0GdZzBtlpiT58czhVCmCMJN4Fbb0QqHOz+EeS2XL+wLr1y0zvn5npja//MLfqLiHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6504

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBPY3Rv
YmVyIDE0LCAyMDI0IDI6NTMgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGR0LWJpbmRp
bmdzOiB3YXRjaGRvZzogYXNwZWVkOiBBZGQgcHJvcGVydHkgZm9yIFdEVA0KPiBTVyByZXNldA0K
PiANCj4gT24gMTQvMTAvMjAyNCAwNDowNywgQ2hpbi1UaW5nIEt1byB3cm90ZToNCj4gPiBIaSBL
cnp5c3p0b2YsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiA+PiBTZW50OiBNb25kYXksIE9jdG9iZXIgNywgMjAyNCAyOjU4
IFBNDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSBkdC1iaW5kaW5nczogd2F0Y2hkb2c6
IGFzcGVlZDogQWRkIHByb3BlcnR5DQo+ID4+IGZvciBXRFQgU1cgcmVzZXQNCj4gPj4NCj4gPj4g
T24gMDcvMTAvMjAyNCAwODozNCwgQ2hpbi1UaW5nIEt1byB3cm90ZToNCj4gPj4+IEFkZCAiYXNw
ZWVkLHJlc3RhcnQtc3ciIHByb3BlcnR5IHRvIGRpc3Rpbmd1aXNoIG5vcm1hbCBXRFQgcmVzZXQN
Cj4gPj4+IGZyb20gc3lzdGVtIHJlc3RhcnQgdHJpZ2dlcmVkIGJ5IFNXIGNvbnNjaW91c2x5Lg0K
PiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IENoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19rdW9A
YXNwZWVkdGVjaC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAuLi4vYmluZGluZ3Mvd2F0Y2hkb2cv
YXNwZWVkLGFzdDI0MDAtd2R0LnlhbWwgICAgICAgICB8IDExDQo+ID4+ICsrKysrKysrKysrDQo+
ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZm
IC0tZ2l0DQo+ID4+Pg0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRj
aGRvZy9hc3BlZWQsYXN0MjQwMC13ZHQueWFtbA0KPiA+Pj4NCj4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvYXNwZWVkLGFzdDI0MDAtd2R0LnlhbWwNCj4gPj4+
IGluZGV4IGJlNzhhOTg2NTU4NC4uNmNjMzYwNGMyOTVhIDEwMDY0NA0KPiA+Pj4gLS0tDQo+ID4+
Pg0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9hc3BlZWQs
YXN0MjQwMC13ZHQueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3dhdGNoZG9nL2FzcGVlZCxhc3QyNDAwLXdkdC4NCj4gPj4+ICsrKyB5YQ0KPiA+Pj4g
KysrIG1sDQo+ID4+PiBAQCAtOTUsNiArOTUsMTcgQEAgcHJvcGVydGllczoNCj4gPj4+ICAgICAg
ICBhcnJheSB3aXRoIHRoZSBmaXJzdCB3b3JkIGRlZmluZWQgdXNpbmcgdGhlDQo+ID4+PiBBU1Qy
NjAwX1dEVF9SRVNFVDFfKg0KPiA+PiBtYWNyb3MsDQo+ID4+PiAgICAgICAgYW5kIHRoZSBzZWNv
bmQgd29yZCBkZWZpbmVkIHVzaW5nIHRoZSBBU1QyNjAwX1dEVF9SRVNFVDJfKg0KPiA+PiBtYWNy
b3MuDQo+ID4+Pg0KPiA+Pj4gKyAgYXNwZWVkLHJlc3RhcnQtc3c6DQo+ID4+PiArICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4gPj4+ICsgICAgZGVzY3Jp
cHRpb246ID4NCj4gPj4NCj4gPj4gV2h5ID4/DQo+ID4+DQo+ID4NCj4gPiAiPiIgd2lsbCBiZSBy
ZW1vdmVkIGluIHRoZSBuZXh0IHBhdGNoIHNlcmllcyBhbmQgdGhlIGRlc2NyaXB0aW9uDQo+ID4g
Y29udGVudCB3aWxsIGJlIGNvbmNhdGVuYXRlZCBhZnRlciB0aGUgY29sb24sICI6Ii4NCj4gPg0K
PiA+Pj4gKyAgICAgIE5vcm1hbGx5LCBBU1BFRUQgV0RUIHJlc2V0IG1heSBvY2N1ciB3aGVuIHN5
c3RlbSBoYW5ncyBvcg0KPiA+PiByZWJvb3QNCj4gPj4+ICsgICAgICB0cmlnZ2VyZWQgYnkgU1cg
Y29uc2Npb3VzbHkuIEhvd2V2ZXIsIHN5c3RlbSBkb2Vzbid0IGtub3cNCj4gPj4+ICsgd2hldGhl
cg0KPiA+PiB0aGUNCj4gPj4+ICsgICAgICByZXN0YXJ0IGlzIHRyaWdnZXJlZCBieSBTVyBjb25z
Y2lvdXNseSBzaW5jZSB0aGUgcmVzZXQgZXZlbnQgZmxhZyBpcw0KPiA+Pj4gKyAgICAgIHRoZSBz
YW1lIGFzIG5vcm1hbCBXRFQgdGltZW91dCByZXNldC4gV2l0aCB0aGlzIHByb3BlcnR5LCBTVw0K
PiA+Pj4gKyBjYW4NCj4gPj4NCj4gPj4gU28gRFRTIGhhcyB0aGlzIHByb3BlcnR5IGFuZCB3YXRj
aGRvZyBiaXRlcyAodGltZW91dCkgYnV0IHlvdSB3aWxsDQo+ID4+IGlnbm9yZSBpdCBhbmQgY2xh
aW0gdGhhdCBpdCB3YXMgc29mdHdhcmUgY2hvaWNlPw0KPiA+Pg0KPiA+DQo+ID4gTm8uIE5vcm1h
bGx5LCB3aGVuIFdEVCBpcyBlbmFibGVkLCBhIGNvdW50ZXIgaXMgYWxzbyBiZSBlbmFibGVkLiBX
aGVuDQo+ID4gdGhlIGNvdW50ZXIgaXMgZXF1YWwgdG8gYW4gZXhwZWN0ZWQgdmFsdWUsIHRpbWVv
dXQgZXZlbnQgb2NjdXJzLg0KPiA+IEFTVDI2MDAgaGFyZHdhcmUgc3VwcG9ydHMgYSBTVyBtb2Rl
LCB3aGVuIGEgbWFnaWMgbnVtYmVyIGlzIGZpbGxlZA0KPiA+IGludG8gYSBzcGVjaWZpYyByZWdp
c3RlciwgV0RUIHJlc2V0IGlzIHRyaWdnZXJlZCBpbW1lZGlhdGVseSB3aXRob3V0DQo+IGNvbnRy
b2xsaW5nIHRoZSBjb3VudGVyIGFuZCB0aGUgY291bnRlciBpcyBub3QgY291bnRlZC4NCj4gPiBU
aHVzLCBXRFQgdGltZW91dCBkb2Vzbid0IG9jY3VyLg0KPiANCj4gSG93IGlzIHRoaXMgYSBubz8N
Cj4gDQoNCkl0IGlzIHVzZWQgdG8gZW1waGFzaXplIHRoYXQgdGhlIGRyaXZlciBkb2VzbuKAmXQg
aWdub3JlIHRoZSB0aW1lb3V0IGV2ZW50DQpiZWNhdXNlIHRoZSBjb3VudGVyIGlzIG5vdCBjb3Vu
dGVkIHdoZW4gU1cgbW9kZSBpcyB1c2VkIGFuZCB0aHVzLCBubw0KdGltZW91dCBvY2N1cnMuDQoN
Cj4gPg0KPiA+PiBUaGlzIGRvZXMgbm90IG1ha2UgbXVjaCBzZW5zZSB0byBtZSwgYXQgbGVhc3Qg
YmFzZWQgb24gdGhpcw0KPiA+PiBleHBsYW5hdGlvbg0KPiA+Pg0KPiA+Pj4gKyAgICAgIHJlc3Rh
cnQgdGhlIHN5c3RlbSBpbW1lZGlhdGVseSBhbmQgZGlyZWN0bHkgd2l0aG91dCB3YWl0IGZvciBX
RFQNCj4gPj4+ICsgICAgICB0aW1lb3V0IG9jY3Vycy4gVGhlIHJlc2V0IGV2ZW50IGZsYWcgaXMg
YWxzbyBkaWZmZXJlbnQgZnJvbQ0KPiA+Pj4gKyB0aGUNCj4gPj4gbm9ybWFsDQo+ID4+PiArICAg
ICAgV0RUIHJlc2V0LiBUaGlzIHByb3BlcnR5IGlzIG9ubHkgc3VwcG9ydGVkIHNpbmNlIEFTVDI2
MDANCj4gcGxhdGZvcm0uDQo+ID4+DQo+ID4+IFN1cHBvcnRlZCBhcyBkcml2ZXJzPyBIb3cgaXMg
dGhpcyByZWxhdGVkPyBPciB5b3UgbWVhbiBoYXJkd2FyZT8gVGhlbg0KPiA+PiBwcm9wZXJ0eSBz
aG91bGQgYmUgcmVzdHJpY3RlZCB0aGVyZS4NCj4gPj4NCj4gPg0KPiA+IEl0IGlzIGEgaGFyZHdh
cmUgc3VwcG9ydGVkIGZ1bmN0aW9uIG9uIEFTVDI2MDAuIEZvciBwbGF0Zm9ybQ0KPiA+IGNvbXBh
dGliaWxpdHksIHdpdGhvdXQgdGhpcyBwcm9wZXJ0eSwgYWxsIGJlaGF2aW9ycyBhcmUgdGhlIHNh
bWUgYXMgdGhlDQo+IHByZXZpb3VzIGdlbmVyYXRpb24gcGxhdGZvcm0sIEFTVDI1MDAuDQo+ID4N
Cj4gPiBUaGlzIHByb3BlcnR5IG1heSBiZSByZW1vdmVkIGluIHRoZSBuZXh0IHBhdGNoIHNlcmll
cyB3aXRoIHJlZmVycmluZw0KPiA+IHRvIFJvYiBzdWdnZXN0aW9uDQo+IA0KPiBzL21heS93aWxs
Lw0KPiANCg0KVGhpcyBwcm9wZXJ0eSB3aWxsIGJlIHJlbW92ZWQgaW4gdGhlIG5leHQgcGF0Y2gg
c2VyaWVzLg0KDQo+ID4gaW4gdGhlIG90aGVyIHJlcGx5LiBBZnRlciBjaGVja2luZyB3aXRoIHRo
ZSBtYWpvciB1c2VycywgaXQgaXMNCj4gPiBmZWFzaWJsZSB0byByZW1vdmUgdGhpcyBwcm9wZXJ0
eSBhbmQgdXNpbmcgU1cgcmVzZXQgYnkgZGVmYXVsdCB3aGVuDQo+ID4gdGhlIHJlc3RhcnQgb3Bl
cmF0aW9uIGlzIHRyaWdnZXJlZCBieSBTVyBkZWxpYmVyYXRlbHkgb24gQVNUMjYwMCBwbGF0Zm9y
bS4NCj4gPg0KPiANCj4gDQoNCkJlc3QgV2lzaGVzLA0KQ2hpbi1UaW5nDQo=

