Return-Path: <linux-watchdog+bounces-2392-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372A9B747A
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Oct 2024 07:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 318FAB230E7
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Oct 2024 06:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C865A13DDAE;
	Thu, 31 Oct 2024 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="IJ6ZPLRu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2102.outbound.protection.outlook.com [40.107.117.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4346345025;
	Thu, 31 Oct 2024 06:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730355975; cv=fail; b=rGX66eylbSz0jnzHiaJzFWCwZK2QyhfF7BCD6vI+4bVAy9p9dnCsnx/MvdQKAn06dNs+zn4guDSQ95uJ0zLbNPiRm3cBJvDadb32sgmO+GtrQb0yBjmrnUEDSrjF2S7stJJIeYW+hGmVJCXDxHeNVJOwSdXmPk6phXGW3VnhjyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730355975; c=relaxed/simple;
	bh=EhCoGdyO/ZQ7KJRcPvm339d2S9hdtYne9/IzSyiq6IQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S7+K8epXCKgdjwQ6ztCwg2VtQZ0su+erVos1ZdThyM3HuC5e+Byqlpowdyg+sfkfGOlpZCO5KdTQw6AIASJ1ulbgQwtS0Cx09GRY8tcFDAnq3sWFC+AlTpEKLz1H+Up0MuItqkEhNtRjwlXsHThAeoHhNHlAdfCiXKiAKL2shfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=IJ6ZPLRu; arc=fail smtp.client-ip=40.107.117.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjkmQJl6SNcab/V7e/N/CYLF5Btl1RFVNySITam3QsMZ0WXfYdPT1kp5R6iyuXIjTCciWeX9PJm04Y+xpoU06r21YMkvq4jVO4W5G0csoSKI8kQTec5gZf94SmUhvdVUyPalTM2y32npucRiHcwjlQwSavIYO+w/cdDhDe1cH43LJXzUap+83qiS1AXAFXt6kXHOMh8WYuhWA/ufRF7OOa+qs083PNN/Iwmb5og423XF9LF5Edt6SnCWIdq4B7f9DUhHuYekz6sxibckskVBQagvxHIA74pfenQ1W29/WeituRCEtqJl9I/XZcVB1jy530M2LrXCeFQDj3wQhjcj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhCoGdyO/ZQ7KJRcPvm339d2S9hdtYne9/IzSyiq6IQ=;
 b=fBoKgLPsTg4+gV7Fug+mGV+/M/3SD9czpJoPZbJ8dN3YJHhyHibHruRfOecHEbCfn9+dLjYARacUIhMy/qcB0uvDKdBzLc/VRUJCkqwkUR9nTv+xmabxMGKNY+mW+rTUydpycyX4C7tKmpXWbhxhDpMubKjbdv+BIWvgs4yYdUW+xYGosc4MHiRTYk1ZR18RVZ8oO9mo9jBW8lNgwzTTtau5hVEzLvCXcENHG1GHK9CpMWqljKyk8eAiI1TMgG4Bpq90b03SSGRpv1pFvZzSOxEOKWmManzSmD6jTqo3qDW5wvxUN9+uSUyKZIOMZBCOXZ60BHTyEiEIH+esMRdRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhCoGdyO/ZQ7KJRcPvm339d2S9hdtYne9/IzSyiq6IQ=;
 b=IJ6ZPLRu34Hm7aOZO267qB4Zx2GfWMRe+ch/CoXEA1rrPBoumDhnDcn+kqkbwc4hAgOssnhdhbdWuGdAkM/c6gHym914HiOh7vCCmJ3zJnf804iBiv/kPm7pYrafBUPDMFBAqTCp3P+beNrbVXxIZy49yBZJC55ir+f7Jt4eBR2CMUhMEn9sEClWF6i6AbqLJWkzFQshwCi3asg5W6diUUz2f8Eox8ZS0XMKZNhS1b6jELy4Zge+CsIEwbpvv6O8yCDSl9ScXmHGrSP4C8r6Dww9Khh69qMxki3md/PPDxSlv6sR9g+tkQB1AKJCsQ1ASTJeHhFHlmToesDCTeqWoQ==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYZPR06MB7039.apcprd06.prod.outlook.com (2603:1096:405:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Thu, 31 Oct
 2024 06:25:40 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8114.013; Thu, 31 Oct 2024
 06:25:40 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
CC: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
	"Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
	"Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>, "DELPHINE_CHIU@wiwynn.com"
	<DELPHINE_CHIU@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>,
	"chnguyen@amperecomputing.com" <chnguyen@amperecomputing.com>
Subject: RE: [PATCH v3 2/2] watchdog: aspeed: Add support for SW restart
Thread-Topic: [PATCH v3 2/2] watchdog: aspeed: Add support for SW restart
Thread-Index: AQHbKrkco2Spy7kfP0KyC5ZJBNoVhrKf+zwAgABpwsA=
Date: Thu, 31 Oct 2024 06:25:40 +0000
Message-ID:
 <TYZPR06MB5203BAF432DEC3753F924D8AB2552@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241030104717.168324-1-chin-ting_kuo@aspeedtech.com>
	 <20241030104717.168324-3-chin-ting_kuo@aspeedtech.com>
 <f7148ed6d4ef835d60fd1aa7141b5f0a9cb69eff.camel@codeconstruct.com.au>
In-Reply-To:
 <f7148ed6d4ef835d60fd1aa7141b5f0a9cb69eff.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYZPR06MB7039:EE_
x-ms-office365-filtering-correlation-id: 26667790-dec9-478e-ddb8-08dcf974d773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjFxcmNZbVRSTHRqTmgzaGZnajZtUjNBb3RpK3dWek1NblY5Qkh6cVgxWENo?=
 =?utf-8?B?LytzcnVES0piL3pFY05taWJlUW5lYkpMRmZERVFFVktZNnhRQjI1UHJSNGhj?=
 =?utf-8?B?ZEpka2pyTUorcDlpZURVRHkzeHF1eVJlM3JacWRIbzdZSk5nNG42NDdYWWlS?=
 =?utf-8?B?L2lxa2VrUHdmYTcxb2Q4UVVEejIwdDMrU0tZOHA3YzE1NTIrems1QVdEVExp?=
 =?utf-8?B?bGFmQ2lYemxackNPQmdZaTVia05zc1pJQ08xbzN6QVZObUxJVjNJcnBYU2hQ?=
 =?utf-8?B?MkJNWHlaWnFFWXFRVlZ5akdueHA3WENaUkQvWnZvMVNwbkVBL1BYWG5jU3lG?=
 =?utf-8?B?S1dQb2xqQVpET2ZyUEZMVkJDVFVFTUVwVW9kVVhwVldVeTFhVDVoTkkyYVN1?=
 =?utf-8?B?NWJ2b21LYlVEZSs1ZG5TQXQxa1FtRWZPek56WDZySlVBUm9CNVNsYTU2bjd2?=
 =?utf-8?B?QnJSaXg3aGtDeUl5enpwRXZpaVh2ODF5R3laSjc1K3BUMWl6dzVOYjFIL0Rl?=
 =?utf-8?B?UTBUa1l4VEZqdldJdXJFSFF2Z2ZEOXZhUW1LR051akJJNW5FbDZHMmZmQWFx?=
 =?utf-8?B?aVJiRGlDc2ZMSGMxV1piMjF2WksybURIN0h4bzZqNjloUDRFK2FBbmRaZ1M0?=
 =?utf-8?B?U2JZV0NDYUIycTR0SHVuSlh0NmFrcUtWbUs5WG9aVFJ0T1c5ZmZkUUFFS2xq?=
 =?utf-8?B?Ynp3SHY2eGNJV2VJMXF2RmpoS2doUGIrT0I0ejVHNVhvcG5kdyt4MjRTTmdQ?=
 =?utf-8?B?dGdVZ25haTcvWUFBMVVVZWMwWXZreG9HbXh2cnF4UWwrcy94T0pMeVllU1VU?=
 =?utf-8?B?MXVJQW1QSW9hNVFtSXlDQ2IvYXZ6S1pXTHdFdGtEQ3pXWjd5Z2ltNXBMNlFC?=
 =?utf-8?B?L2NpcXFuN0VFRExUMDZKdk1CZS9vQVZCS0JCREpGYkZNUU5ndVBRc0FGY1BO?=
 =?utf-8?B?aFJFbnMzbWVWZFliVHFZWlkxbXRIU2Izc1lpMUFoY0pzLzBrT3YvM2hzdlFB?=
 =?utf-8?B?ZzNXa1lLK095V0hWREIvZ2NISUU2QWV4VG9rVGljSngrYXRQN0x3V2krRHZH?=
 =?utf-8?B?Qk5IY2xSZzZYd3R1RGxXdlZ6TUJBK3JtMEVrRENiNzJyWSsrOWE5RzNkQWh3?=
 =?utf-8?B?Mm5GWXJjTnYyQzVFWGMxeWNqUFlIaW4wdmhsZ2k3WEdZSy9OSWdWWk5JamZB?=
 =?utf-8?B?ejRYazBRSndKUHE0Zy92KzVOc1Npdi9IdkFlVmpIelJtRUJxeFNWUnpzRndG?=
 =?utf-8?B?T29JLzdTb3Yvd2l1eEVsN1lyVHJTUWF2ckh5cjIrZEdHVzYrRnJKc2FRZVhS?=
 =?utf-8?B?NXl5Y1pxak94SzJLYnlzQlkxUW93U0ZCMVdtRG9rUlNOZ0lTaXl2SVBxLzRD?=
 =?utf-8?B?Mzd1Y3A2VXhFT3FqL3I2cXRpRHpIQ3Yxa0lGT0dldGlxZk9yWVQ5REQ1UFFR?=
 =?utf-8?B?VFJXY254Z0N1VEhKWFRxc01CR2dxZjNhZTM3YklVbTh6c3E5ZFpyTDFMdVZO?=
 =?utf-8?B?bnpuL253M1RJUXI2U0Q1bzdRREVMK2ZkUHRvY01rYmtQK2NyZ3pTTHBFZjlD?=
 =?utf-8?B?R09UaTR4UklXQ0RlbjNzZ0pmQUJaTEhzQkJ4RXJ2THJNb0QzbjFpOGF5L3Mz?=
 =?utf-8?B?RHhvVWtwaDZWcm5waFB6T2REWXl5b0EzK05wbzJEWTI5dko2SGZVRDdKcVpP?=
 =?utf-8?B?cTRzZjJxKzVsN1UwdHZoLytIWmp4bW9uRkRqNFJDcWNVWEQ4SzNTVFZHZFlN?=
 =?utf-8?B?bFJRdUVnUVhYM2VsTlhvaDlkVmQ0d2pvK0lOTmZvK3Qwd3BzS01BWHBqenpn?=
 =?utf-8?B?MkVzbnVCc3RjNWRqUVlOK2UwV3NMQW12ZDZBMi9tajhvQW5sR3FmQmlZOFZF?=
 =?utf-8?Q?w8EqHxA3EaW9Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V05hN21sV1Z2TjErVFhBOHpuQnQwSXhMaWg0REE2MGw4ajQzTmFyZjYzM0E4?=
 =?utf-8?B?TEU2d2duazhoK2J4Z2hwOGVtM3VtWHpKNnlGUlAzNVRKendEWHlyeks5ZTFq?=
 =?utf-8?B?K0k1dlIyaFlkbEZnQ1VwQWQzUHIzdGF6VU1HWDRWV241bzFLY3ExQnF0MW5k?=
 =?utf-8?B?SWxUb25zcG05ZzRMMUltdVFXdlhOcE15YjJvM1Bya044K3c4V3FkWmxTYThW?=
 =?utf-8?B?QU0xaUNDK1M5RGUvTVhqYy9iOEJvekpyWXFGUU9nWEI0YVY0aVk1b0RnaXlL?=
 =?utf-8?B?OUNwWjBhUHJ2S1cxb3pSYWg5MGdYUEI3YksvTHZFWHR6VkJPT0x4NnVSWlhn?=
 =?utf-8?B?SDFMWjdZT1dYaFRRa3FoRkxqNVRvY2hpVDk0SThNU0QwNDUzVk5IZ2R3OHZ3?=
 =?utf-8?B?QXFFUkZsZnh4TGVRbTFucU5GOFh4emp5Qzg0MUlreFRpMHBwLzduMisrMXlD?=
 =?utf-8?B?MHdYY29IdWc4bS9pWi80dHg5ei9uZnZsZmdHWWdVKzZodlJPNFNyQWZwdHhv?=
 =?utf-8?B?VVJmSkJoelRyRHUvT0l1Z2tFL3p0UmJuRVpQOW5sQjRLR21ROVM3NXhqREZG?=
 =?utf-8?B?NHNXclJCUHBVWkFoL215MS92aHljNGZWU2dJVDFTSitTcVFBWWdJVk1pc0ln?=
 =?utf-8?B?WDFQZzByUFVYY1NCVzBHVk9vU0NRZmtPRmlZdSs1cVd6cXhHWTlLaVlRYjJL?=
 =?utf-8?B?VVpEdm1EZ1dxcjRJT0ptWGNLMlFsTVVYQ3k5UUxtWGozZlVDdzh4MzBqSjh6?=
 =?utf-8?B?YlZPSXlWelBMd1VLQTVKaWpidHh4VzN2L3JBdUJHM1IrMnJIeUJIdnZ2ZW44?=
 =?utf-8?B?cE41M0w5TTFKUVI0VVQ5aklUOUcwdXNnQWxFQ1VnUlRsWmdBNUljWkxiUTNj?=
 =?utf-8?B?b1dtUVBQeG5la0Fzakw3STFHcVpTYktpdUxCS1RvRFFSSEUzbFFTYTZQSHpU?=
 =?utf-8?B?YkhxRVpmL2E0SzJxb2g3V3RISDcyRksyUU9CSVBIWG1NT2g0NHJCQTlxUm5Z?=
 =?utf-8?B?Wlp3dEZnRnV2bjRCK3Q3Qm0yWENtMXlZU0p4OUVyUDg4UVJNaTlOd0RvZm5Q?=
 =?utf-8?B?V2ZsSjlMRGVyWXUxUERtVEx0SURNa1p0TFZNeGUxWGJXTGxYT0tEOUorTFRH?=
 =?utf-8?B?VjFxNEZYM2dQcFp1NnlnaGEwa2JnVFc4YnppeGNKMzdWSW1QYys4R1ZJZldK?=
 =?utf-8?B?OVNZbWp2YnMyNStpVzhEemREL1NWYWxvYjd1TndCWUI1REdVNGpTS1hCVFJR?=
 =?utf-8?B?UFdYSmloL0lJU2NsYWRJNTJGaEh0bytsUXhhQ0F1YTgrcE56OXJmYVJiRlg5?=
 =?utf-8?B?VzNBMFFXaDU0c0xVWmtLUXk2Ri8yQjY5b3lzdjN1a3VjdElFTWE4enl0RjBh?=
 =?utf-8?B?cnlNMzhKYU93Ykk0OUZWQXlxMmV1WXpHSm5vbFBQcHhja255Tm43SWxYekFG?=
 =?utf-8?B?d1NXKzkzd0xNeWFwUUZXWE1GeGpSOEV3dXBXaTNTdHYzayt1MWw3Q05rT1p5?=
 =?utf-8?B?RDd1WFgrM0lZQmp6cWF3aXVWVUxzZmdZVFJwSzl4cnl6NHQwdDVSc1kzdmdv?=
 =?utf-8?B?a0djcVdCMFgraktHb0NQYVdRNnh1cklFajBPYzArU2hBZUlheVArUm1md1hy?=
 =?utf-8?B?K2thNDNEQjI2QWtRQW5IY1JIMjhHcG5WN1RMNFZBckdqVE51SUc0ckZlY0FM?=
 =?utf-8?B?dE04TXJFT0ZwSHNtbHpqQVVlcjhtNDNlRDlTdlREWmtEcHgydThoTFg2R1B1?=
 =?utf-8?B?UHo4OFAraEpnaFhTdEFydFNXZjZBMTMwakZ5YU52YlkwRUdueS84M2VwWWlW?=
 =?utf-8?B?eUpQL21lU3JyRGVwdmRoNkhGMmt0aGlCQ3JGVTNTL01SK0hiZGdjYVFzTWUr?=
 =?utf-8?B?VWF2ZVliSENkNk9LU0pCRFFCc0RiQmRnYms2UnNYWjhOYW5WQndVWkZyV3Fm?=
 =?utf-8?B?d05wSWpIMEtVM2k0dWdHMHgwR1JvakluZVBocWpQVUVJZmd2Mi9mMHdNVzhB?=
 =?utf-8?B?Q2twYVRVbWs4UkdteWQ4NkxlUVVCTGszZlVYQTZQWm9YclVVVUJrWjdXSjBa?=
 =?utf-8?B?QVJWbWdjQ0JLcGlOYnp6ZHdNNi96M1hQWDRSTUhSR0tubzV6SVluT05kcHM1?=
 =?utf-8?B?SzMrS2JJZVc2aDl0VEl4Slp0OEFSVnFURHNZZC9EWmIza0lsUmVNNUhDdjM1?=
 =?utf-8?B?T0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26667790-dec9-478e-ddb8-08dcf974d773
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 06:25:40.5422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9WKXxcLyYWevMiumBJ2K/4OyoFmsbihvG2slWB/HEzgdHJRvVQJpedomYQ6dfs1x7I0u5Cl4L/MtEVO5vutdqwAa7rwnn7qEaDGk92V5tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7039

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+DQo+IFNlbnQ6IFRodXJzZGF5
LCBPY3RvYmVyIDMxLCAyMDI0IDg6MDQgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzJd
IHdhdGNoZG9nOiBhc3BlZWQ6IEFkZCBzdXBwb3J0IGZvciBTVyByZXN0YXJ0DQo+IA0KPiBPbiBX
ZWQsIDIwMjQtMTAtMzAgYXQgMTg6NDcgKzA4MDAsIENoaW4tVGluZyBLdW8gd3JvdGU6DQo+ID4g
U2luY2UgQVNUMjYwMCwgZXhjZXB0IGZvciBIVyBXRFQgY291bnRlciB0aW1lb3V0LCBIVyBXRFQg
cmVzZXQgY2FuDQo+ID4gYWxzbyBiZSB0cmlnZ2VyZWQgYnkganVzdCBjaW5maWd1cmluZyBzb21l
IEhXIHJlZ2lzdGVycyBieSBTVw0KPiA+IGRpcmVjdGx5LiBXZSBuYW1lZCBpdCAiU1cgcmVzdGFy
dCIuDQo+ID4gQWx0aG91Z2ggaXQgaXMgIlNXIiByZXN0YXJ0LCBpdHMgbWVjaGFuaXNtIGlzIGlt
cGxlbWVudGVkIGJ5IEhXLg0KPiA+DQo+ID4gT3JpZ2luYWxseSwgc3lzdGVtIGNhbiBvbmx5IGtu
b3cgaXQgaXMgcmVzZXQgYnkgV0RUIHRocm91Z2ggYSByZXNldA0KPiA+IGZsYWcuIEhvd2V2ZXIs
IHNpbmNlIEFTVDI2MDAsIFNXIGNhbiB0cmlnZ2VyIHRoZSByZXNldCBldmVudA0KPiA+IGNvbnNj
aW91c2x5IGFuZCBkaXJlY3RseSB3aXRob3V0IHdhaXQgZm9yIFdEVCB0aW1lb3V0LiBXRFQgY291
bnRlciBpcw0KPiA+IG5vdCBlbmFibGVkIHdoZW4gU1cgcmVzdGFydCBpcyBhZG9wdGVkLiBBZnRl
ciB0aGF0LCBhbiBpbmRlcGVuZGVudA0KPiA+IHJlc2V0IGV2ZW50IGZsYWcgd2lsbCBiZSBzZXQg
YWZ0ZXIgc3lzdGVtaXMgcmVzZXQgYnkgU1cuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlu
LVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+IMKg
ZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMgfCA0MA0KPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dkdC5jDQo+
ID4gYi9kcml2ZXJzL3dhdGNoZG9nL2FzcGVlZF93ZHQuYyBpbmRleCBhZGQ3NmJlM2VlNDIuLjFl
OTgwOGQ0MjAyMw0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVk
X3dkdC5jDQo+ID4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMNCj4gPiBAQCAt
NDIsNiArNDIsOSBAQCBNT0RVTEVfUEFSTV9ERVNDKG5vd2F5b3V0LCAiV2F0Y2hkb2cgY2Fubm90
DQo+IGJlDQo+ID4gc3RvcHBlZCBvbmNlIHN0YXJ0ZWQgKGRlZmF1bHQ9Ig0KPiA+DQo+ID4gwqAj
ZGVmaW5lIFdEVF9SRUdfT0ZGU0VUX01BU0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDAwMDAw
ZmZmDQo+ID4NCj4gPiArLyogV0RUIGJlaGF2aW9yIGNvbnRyb2wgZmxhZyAqLw0KPiA+ICsjZGVm
aW5lIFdEVF9SRVNUQVJUX1NZU1RFTV9TV19TVVBQT1JUwqDCoDB4MDAwMDAwMDENCj4gPiArDQo+
ID4gwqBzdHJ1Y3QgYXNwZWVkX3dkdF9zY3Ugew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBjb25zdCBj
aGFyICpjb21wYXRpYmxlOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgcmVzZXRfc3RhdHVzX3Jl
ZzsNCj4gPiBAQCAtNTUsNiArNTgsNyBAQCBzdHJ1Y3QgYXNwZWVkX3dkdF9jb25maWcgew0KPiA+
IMKgwqDCoMKgwqDCoMKgwqB1MzIgaXJxX3NoaWZ0Ow0KPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIg
aXJxX21hc2s7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiByZWdfc2l6ZTsNCj4gPiArwqDCoMKg
wqDCoMKgwqB1MzIgZmxhZ3M7DQo+IA0KPiBXaHkgYWRkIHRoZSBmbGFncyBtZW1iZXIgcmF0aGVy
IHRoYW4gY2hhbmdlIHRoZSByZXN0YXJ0IGNhbGxiYWNrIGZvciB0aGUNCj4gMjYwMD8gVGhlIGxh
dHRlciBzZWVtcyBtb3JlIGRpcmVjdCB0byBtZS4NCj4gDQoNClJlc3RhcnQgY2FsbGJhY2sgZnVu
Y3Rpb24gd2lsbCBiZSBiZXR0ZXIgYW5kIGl0IHdpbGwgYmUgYWRkZWQgaW4gdGhlIG5leHQgcGF0
Y2guDQoNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGFzcGVlZF93ZHRfc2N1IHNjdTsNCj4g
PiDCoH07DQo+ID4NCj4gPiBAQCAtNzEsNiArNzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFz
cGVlZF93ZHRfY29uZmlnIGFzdDI0MDBfY29uZmlnDQo+ID4gPSB7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoC5pcnFfc2hpZnQgPSAwLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuaXJxX21hc2sgPSAwLA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqAucmVnX3NpemUgPSAweDIwLA0KPiA+ICvCoMKgwqDCoMKgwqDC
oC5mbGFncyA9IDAsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5zY3UgPSB7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQwMC1zY3Ui
LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnJlc2V0X3N0YXR1c19yZWcg
PQ0KPiBBU1QyNDAwX1NDVV9TWVNfUkVTRVRfU1RBVFVTLCBAQA0KPiA+IC04NSw2ICs5MCw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3dkdF9jb25maWcgYXN0MjUwMF9jb25maWcgPQ0K
PiA+IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmlycV9zaGlmdCA9IDEyLA0KPiA+IMKgwqDCoMKg
wqDCoMKgwqAuaXJxX21hc2sgPSBHRU5NQVNLKDMxLCAxMiksDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oC5yZWdfc2l6ZSA9IDB4MjAsDQo+ID4gK8KgwqDCoMKgwqDCoMKgLmZsYWdzID0gMCwNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgLnNjdSA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLXNjdSIsDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAucmVzZXRfc3RhdHVzX3JlZyA9DQo+IEFTVDI0MDBfU0NVX1NZ
U19SRVNFVF9TVEFUVVMsIEBADQo+ID4gLTk5LDYgKzEwNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYXNwZWVkX3dkdF9jb25maWcgYXN0MjYwMF9jb25maWcgPQ0KPiA+IHsNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgLmlycV9zaGlmdCA9IDAsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5pcnFfbWFzayA9
IEdFTk1BU0soMzEsIDEwKSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnJlZ19zaXplID0gMHg0MCwN
Cj4gPiArwqDCoMKgwqDCoMKgwqAuZmxhZ3MgPSBXRFRfUkVTVEFSVF9TWVNURU1fU1dfU1VQUE9S
VCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnNjdSA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXNjdSIsDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAucmVzZXRfc3RhdHVzX3JlZyA9DQo+IEFTVDI2
MDBfU0NVX1NZU19SRVNFVF9TVEFUVVMsIEBADQo+ID4gLTEzNiw2ICsxNDMsMTEgQEAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgYXNwZWVkX3dkdF9vZl90YWJsZSk7DQo+ID4gwqAjZGVmaW5lwqDC
oCBXRFRfQ0xFQVJfVElNRU9VVF9BTkRfQk9PVF9DT0RFX1NFTEVDVElPTsKgwqDCoMKgQg0KPiBJ
VCgwKQ0KPiA+IMKgI2RlZmluZSBXRFRfUkVTRVRfTUFTSzHCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoDB4MWMNCj4gPiDCoCNkZWZpbmUgV0RUX1JFU0VUX01BU0sywqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAweDIwDQo+ID4gKyNkZWZpbmUgV0RUX1NXX1JFU0VUX0NUUkzC
oMKgwqDCoMKgwqAweDI0DQo+ID4gKyNkZWZpbmXCoMKgIFdEVF9TV19SRVNFVF9DT1VOVF9DTEVB
UsKgwqDCoMKgwqAweERFQURERUFEDQo+ICNkZWZpbmUNCj4gPiArV0RUX1NXX1JFU0VUX0VOQUJM
RcKgwqAweEFFRURGMTIzICNkZWZpbmUNCj4gV0RUX1NXX1JFU0VUX01BU0sxwqDCoMKgwqDCoDB4
MjgNCj4gPiArI2RlZmluZSBXRFRfU1dfUkVTRVRfTUFTSzLCoMKgwqDCoMKgMHgyYw0KPiA+DQo+
ID4gwqAvKg0KPiA+IMKgICogV0RUX1JFU0VUX1dJRFRIIGNvbnRyb2xzIHRoZSBjaGFyYWN0ZXJp
c3RpY3Mgb2YgdGhlIGV4dGVybmFsIHB1bHNlDQo+ID4gKGlmIEBAIC0yNTUsMTAgKzI2NywzMSBA
QCBzdGF0aWMgaW50IGFzcGVlZF93ZHRfc2V0X3ByZXRpbWVvdXQoc3RydWN0DQo+ID4gd2F0Y2hk
b2dfZGV2aWNlICp3ZGQsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiA+IMKgfQ0K
PiA+DQo+ID4gK3N0YXRpYyB2b2lkIGFzcGVlZF93ZHRfc3dfcmVzZXQoc3RydWN0IHdhdGNoZG9n
X2RldmljZSAqd2RkKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGFzcGVlZF93ZHQgKndk
dCA9IHRvX2FzcGVlZF93ZHQod2RkKTsNCj4gPiArwqDCoMKgwqDCoMKgwqB1MzIgY3RybCA9IFdE
VF9DVFJMX1JFU0VUX01PREVfU09DIHwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBXRFRfQ1RSTF9SRVNFVF9TWVNURU07DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDC
oHdyaXRlbChjdHJsLCB3ZHQtPmJhc2UgKyBXRFRfQ1RSTCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
d3JpdGVsKFdEVF9TV19SRVNFVF9DT1VOVF9DTEVBUiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgd2R0LT5iYXNlICsgV0RUX1NXX1JFU0VUX0NUUkwpOw0KPiA+ICvCoMKgwqDCoMKg
wqDCoHdyaXRlbChXRFRfU1dfUkVTRVRfRU5BQkxFLCB3ZHQtPmJhc2UgKw0KPiBXRFRfU1dfUkVT
RVRfQ1RSTCk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoC8qIHN5c3RlbSBtdXN0IGJlIHJl
c2V0IGltbWVkaWF0ZWx5ICovDQo+ID4gK8KgwqDCoMKgwqDCoMKgbWRlbGF5KDEwMDApOw0KPiA+
ICt9DQo+ID4gKw0KPiA+IMKgc3RhdGljIGludCBhc3BlZWRfd2R0X3Jlc3RhcnQoc3RydWN0IHdh
dGNoZG9nX2RldmljZSAqd2RkLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBhY3Rpb24sIHZvaWQNCj4g
KmRhdGEpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBhc3BlZWRfd2R0ICp3
ZHQgPSB0b19hc3BlZWRfd2R0KHdkZCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0
IGFzcGVlZF93ZHRfY29uZmlnICpjZmcgPSB3ZHQtPmNmZzsNCj4gPiArDQo+ID4gK8KgwqDCoMKg
wqDCoMKgaWYgKGNmZy0+ZmxhZ3MgJiBXRFRfUkVTVEFSVF9TWVNURU1fU1dfU1VQUE9SVCkgew0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhc3BlZWRfd2R0X3N3X3Jlc2V0KHdk
ZCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoH0NCj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKgwqB3ZHQtPmN0cmwgJj0gfldE
VF9DVFJMX0JPT1RfU0VDT05EQVJZOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBhc3BlZWRfd2R0X2Vu
YWJsZSh3ZHQsIDEyOCAqIFdEVF9SQVRFXzFNSFogLyAxMDAwKTsgQEANCj4gLTUyOSw2DQo+ID4g
KzU2MiwxMyBAQCBzdGF0aWMgaW50IGFzcGVlZF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAobnJzdG1hc2sgPiAxKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3cml0ZWwocmVzZXRfbWFza1sx
XSwNCj4gd2R0LT5iYXNlICsNCj4gPiBXRFRfUkVTRVRfTUFTSzIpOw0KPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKHdkdC0+Y2ZnLT5mbGFncyAmDQo+IFdEVF9SRVNUQVJUX1NZU1RFTV9TV19T
VVBQT1JUKQ0KPiANCj4gVGhpcyBjb25kaXRpb24gY291bGQgYmUgYSBtYXRjaCBhZ2FpbnN0IHRo
ZSBjb21wYXRpYmxlIGlmIHlvdSBkcm9wIHRoZSBmbGFncw0KPiBtZW1iZXIuDQo+IA0KPiBPciwg
YXNzdW1pbmcgdGhlIHNvZnR3YXJlIHJlc2V0IG1hc2tzIGFyZSBub3QgYWRqdXN0ZWQgZWxzZXdo
ZXJlLCBtb3ZlIHRoZQ0KPiBjb3BpZXMgYmVsb3cgaW50byB0aGUgYXN0MjYwMC1zcGVjaWZpYyBy
ZXN0YXJ0IGNhbGxiYWNrIGltcGxlbWVudGF0aW9uPw0KPiANCg0KT2theSwgaXQgd2lsbCBiZSBt
b3ZlZCBpbnRvIHRoZSBhc3QyNjAwLXNwZWNpZmljIHJlc3RhcnQgY2FsbGJhY2sgZnVuY3Rpb24u
DQoNCj4gQW5kcmV3DQo+IA0KPiA+IHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IHJlYWRsKHdkdC0+YmFzZSArDQo+IFdEVF9SRVNFVF9N
QVNLMSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB3cml0ZWwocmVnLCB3ZHQtPmJhc2UgKw0KPiBXRFRfU1dfUkVTRVRfTUFTSzEpOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gcmVhZGwo
d2R0LT5iYXNlICsNCj4gV0RUX1JFU0VUX01BU0syKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdyaXRlbChyZWcsIHdkdC0+YmFzZSArDQo+IFdE
VF9TV19SRVNFVF9NQVNLMik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0N
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghb2Zf
cHJvcGVydHlfcmVhZF91MzIobnAsICJhc3BlZWQsZXh0LXB1bHNlLWR1cmF0aW9uIiwNCj4gPiAm
ZHVyYXRpb24pKSB7DQoNCkNoaW4tVGluZw0K

