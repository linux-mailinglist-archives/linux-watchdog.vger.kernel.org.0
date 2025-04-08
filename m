Return-Path: <linux-watchdog+bounces-3228-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1930A7F639
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 09:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C4F17855E
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 07:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A891A9B32;
	Tue,  8 Apr 2025 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KgrwXzQN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8EA23ED60;
	Tue,  8 Apr 2025 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097136; cv=fail; b=fHjFvy6o518NXFjJ2nBv8VFXP3+en5+EceThT/oY00MsV8X4MsbMFlYWvluyksRco6o2pB5JDxYYGopihoWXrrpan6kkun8B1zPMYWhccangr3PLWUL/L22HX6JEC+g+hHCyzdv+GcLKnB/S1EKrkB9017befwaC4yemrDoKWO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097136; c=relaxed/simple;
	bh=YhoY2TI3qu7Up6DMN2eHZFGY8/JICaWFWC9JtUugb5I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SztbIYjZcXk4ISvevGb2EJ5Tm88QmYYbFvdegPxfg1U55Y15J5N7xwqQrE5l7xdQ6/bDGwL0xm70mqDbykXPq8v0DdbuR4UESNuAtND4ekTwxbRBXX/h7odZhS+EWRBapmg2HmvauWbgbMFcn0VMM+c887lcaYmgirxMWdvpxrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KgrwXzQN; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z099mCbFvxfhH7EOspNoxhW9h/ZYft6dhCgNB4tfmkVc1bs6U0FeKW6sWfcGCsxB7CvV01Uke/1Wj+15kXDWg5q+M3YWwxYkX97NRbgPwhiz2JhnJQtWpO0Kn/HEOB/3YmK5x9BFfONAc7lMlDp7QwZfz7SLUNfFDbyUW+BjkcQ4n0729rIvCaygJusWcG9d0uO8CeJJGjK2IhTdlB/sVxSJiiTNURjPTIOkVpQnwDLog0wL5YH7WsL37dYyXUJ82hsMvn1jZVPM40awu0Btw904R/OgOPxh66w5wXOO5KEoP5EdZ4+ojd1a6+YErKh0jPrcSy47fSxQAPKtuMvxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PeMR6YU4SS552NhgmSzEGPi2JzXzbC780tKEN1X5QM=;
 b=MMXOaoTm3/tNZfTCdXVRvxp07Od1Oe+hgAr2ng2exmBR0ifSROStprOdz2RNiRadCPq/mt64cs209Bv7ULPJEUYdKjrR9NksPjsym2KQCmxr/raeORY9vQ/KhR3hUx+butfY7EOLspxKuFOEdFgMmGbVoMxFTXS1moaJU5R3fjIiCZo8g6SorBBaK77N1OfTiAD+z+aj47+RDFA2olfAumogk3WF9BpbD7hhinrRhIDYH65kR6aq6smJMvlL4l3jlq4T1FQCXQTAB87byLQoNRZrT10+W0johUgCdOw2esTJ+7W7wBdrTDwxF+yQeGRMaO8DOiDO53c+6+tga1ivAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PeMR6YU4SS552NhgmSzEGPi2JzXzbC780tKEN1X5QM=;
 b=KgrwXzQNAv5wjKY3eUKV6R6iDEVFFvlqonv7i2dtGUjAp5q5/LSRpYpe5Sg62yHhgEntZCmbM8pG3rASrfgH4htWNyMpY7VCitYVRHXGg0pO+SPBQZZ/TcIV7fVA8NJ5WLpR4Ard/JXvzKBH/7pg2wNNTViQKko9CONj9nEKvm3FEKtzRgAJ6K2nzx5Yq2ZLwBKxeTJvnKCKNAQ5M2WVSk+BayqxvnAnXvScBpNIPw6XIkabXZjQkvVILxsr0rz7U8AW27cQI6/F0el4jHKQfPV5zpVZsx3o/amzCNKsz4Qk7RJGUXqH08TAhyC1GGv3mvYvAaAj4+OrEG45SqNr1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 07:25:30 +0000
Received: from PAXPR04MB8473.eurprd04.prod.outlook.com
 ([fe80::2a15:12f0:d937:151a]) by PAXPR04MB8473.eurprd04.prod.outlook.com
 ([fe80::2a15:12f0:d937:151a%3]) with mapi id 15.20.8606.027; Tue, 8 Apr 2025
 07:25:30 +0000
Message-ID: <a9b50cec-c2c9-4d2b-bf6d-430e58a87ca3@nxp.com>
Date: Tue, 8 Apr 2025 10:25:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: Add the Watchdog Timer for the NXP S32
 platform
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250407160318.936142-1-daniel.lezcano@linaro.org>
 <20250407160318.936142-3-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
In-Reply-To: <20250407160318.936142-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::12) To PAXPR04MB8473.eurprd04.prod.outlook.com
 (2603:10a6:102:1dc::15)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8473:EE_|DUZPR04MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: aebba05a-a01c-4155-29bb-08dd766e8aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmZWUmJJTW9sbUN2Q2t0R3k2dFZBalJHcjhYd2lVaVZyamhvSnpSSkNNSTBB?=
 =?utf-8?B?UkZXZkNISlBTdTBac2cvRnIrMHV5TzRFUXhXN285UzRTUmtLTzdxWUhGR3Br?=
 =?utf-8?B?KzJZdlJBVlNCN3dYb3laSkJBZkJuUkcvTVhBbUFsV2hOb2lzMDV0YjhETDBH?=
 =?utf-8?B?czNSZUtRVzZVaFhxV2RjQWVjRkpCMndGSWxZOTd3UTVvWGppaS9jRG5icGIv?=
 =?utf-8?B?NkFPZGRVRlBTQThrMzNqL3NETXVSZzRTdFNnUk9VNENXcDBkSytmZ1E3V01O?=
 =?utf-8?B?azRZTTVydU9ab0ZrejFtK29VcHJnK21PSjhiOUd6S0RMVVYwSThTVzFWcG83?=
 =?utf-8?B?NHNQZDREU0dnNzFmRzRQZTRsVlY4czlTay9VdUE1dUE3VkRaT2dTUk5rSW11?=
 =?utf-8?B?TEJoTDliSGRDVnhFWEd3cEVzY3FpWkh1akJhTGcwdHlmVkIycWx3OGRaZmVG?=
 =?utf-8?B?ajRIb2pnaGZ5ZnhWa1dPTXNRdGNKT1pLbU1pM3ZWZERsQ0RSK2U4ZGpab3FC?=
 =?utf-8?B?ckFiR3E1RHo3QVhGTm9PdHV2OW5jR0JNQ1dpZ3BXaHpWK1JQZjBZREJCSmFa?=
 =?utf-8?B?Y2VKZnhsb0hJVlRSL2JIQjhzT2cydUU0cW55Q3NaUHZaSmhwQzZSOUdhamN2?=
 =?utf-8?B?bWt2QWpMaG9IckpKT3JGNlJYVjlTQmVvcDh4cDBkQ25ia1luT2RpTmtaQ3Ew?=
 =?utf-8?B?aVRZZ09aOXRUeFMwbXhsMStkcm8wZC9wZUJLTm8xTDlqenpTNTJzaWJXMFgv?=
 =?utf-8?B?YitGdFB4S09QNlA1NWxmbXZ3bTVHajRoMStyOWdsL1hrb21nbUdDRWMyWE50?=
 =?utf-8?B?UUdTMFFaVVRvb2FoeFYzMkw0c3NWTkF3L1hkRnNOS3NEYTBkV0sxWHBqSGlj?=
 =?utf-8?B?a0Y3REZaWGhmbHlaU3puZ2dRSEtjU1JQeXRadHBZdEk1b2tEbXNham5RNEhG?=
 =?utf-8?B?NmlZNGwrVG9zYUFTK3AzRWV2UUxyZFRCTmlXY0dUOVJKQW4ydWpsemtPL2xE?=
 =?utf-8?B?dFFxalM1Z0tpQ3o2YUR1dmxFTWFkTnl0RG12YnF5RlhQNG4wUWFYSXdoRFJv?=
 =?utf-8?B?SU1KVUE5ZzVVRklkam9Lb0FueXNIbHVnZitSWFpIckZ2N3VCYWdYWkxYdjJN?=
 =?utf-8?B?RUhhVDFodSsxMGFHUTMyVDdySkdLZ3VpTGtqY2RNL2RQUkFzWEVJRHZwTnJX?=
 =?utf-8?B?YXduVC9aZmZXK0MzR1h4NDhva3pFT3JGZnRvWXQ2VCtmSXpWZndiRUV6TUUr?=
 =?utf-8?B?aDJQcDNFTmxmc1BKdGN0bnQxZ1JRTS80b3BvUGJGY1RZMlJMYVdxeCszaGht?=
 =?utf-8?B?ejZlT0RUelNsQVpSV2dBZ09NeThQbFRQZGE3UURvZzVDVmR3L1RScjBFT0Fs?=
 =?utf-8?B?amNHQ1REV2tvSFhaaS9tcll6bjRkV1JHK3ZMK0gwNGpiWmdYYlBENTNoZTAw?=
 =?utf-8?B?VVdDWWNBa1l4Ymp0Vks2WFFyQzlkRE9Wb1dmbm81b1Z5NC83SWJMRUsvbllL?=
 =?utf-8?B?QUtSVGFvb1U5Qk5zbTJ0WXlSa1VVOTNEOXcwZGRBUTZBSk5yVTlCZndha3B3?=
 =?utf-8?B?UHB1K0xrOFFhTWNoNzR4eDExMFpJZjcvZnprT2UyMnk4Sm9pbGtvQ1BzQlJB?=
 =?utf-8?B?dCtYMkVvK1lEbXlkNTBBMDBHbmxXbSs1OWc5azZuTWE5NldZaXluaTRFNUt0?=
 =?utf-8?B?VzYzaGJ0cnY3d2pZazFPcXc1WGdSZW1QQkpsTUgramVjVnJualJ6d2Fxa0VW?=
 =?utf-8?B?ZWFEcTBpaXFJNGhaTGREQ205RnFaK0RVaExVdGRQU2dVcGNRS0dSVTBQVWZN?=
 =?utf-8?B?TFNUc2k0WkQyai9aNGFoTUZmUGtTNzBaZXNYQTFDZ0o3VnRsalFkSTBLK0Vp?=
 =?utf-8?Q?e8CJY7ZNzEPkF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8473.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxZaktaTGZ6ZkFVVVU4WXRTaXkza0NiYTE0VHFST1FFUmlmSlZmZkwvaEJ0?=
 =?utf-8?B?TmtmVGhOWXNrNHE0eFYvT1QxYW9KQVhWYUpaL0pIT0JwKzFhMUxZUGdEeW9I?=
 =?utf-8?B?bkVuTUptWVhXU2tpNUk0WGZETmg0UEFrVjd5R3VMd3NpRVNwcWhBMzVwWjJL?=
 =?utf-8?B?amtQcFpheWIvWkdNMnorRUFRRm1PN3pLYk1HeGlKRHY0d1gxRG95cGR0UGp4?=
 =?utf-8?B?YlhDZWF0QmNVaUNEelFjbi94eWFnbWdiWDdBeElEaVlLWDE0Y1l5Ukh1VzdS?=
 =?utf-8?B?QkJkQXN2Y0I1UnRjWGVSVkxGbEFNdFZyR1VPRTlMZXhqZWhtRWlpblZKVFNK?=
 =?utf-8?B?RnR2alFaS2tkemQ0OUlUbGF4T2pNRUdNUkNrd0ZVYnJOK1VnRVNyU0hpSHBI?=
 =?utf-8?B?eVc0Skl2clBxNldWMXltT2VUUEZGcy91aFJpcWoyb292NzdKUHFnbkxveUhM?=
 =?utf-8?B?R0xIQzhvT0dwMys3Rm1uOTZWWHNNOVEvK1I4MWxaUXU2bzU1d3R6WXpoTVZL?=
 =?utf-8?B?UlhsVkdlOUV5K1dMQXJ3T29IQ2hhME9JbTlYMDZYeTA3MURreU9iTkJ2ckQy?=
 =?utf-8?B?dWZmamNlbnJFWTQ1UjlxN2REb1prd2g4QmxNdFlKV2Ztd1RUMG04WHhQbTFs?=
 =?utf-8?B?NC9FcUhWK1V2ZDlvaVhmUkUwSjdDRFhIemd5Zy9SVkZlbDUybzlNS1liWUtP?=
 =?utf-8?B?YmVWbEFoMmxOcko4WjNmZm9mNlZyYVVsQ0JMUkFlbSsvT2dNN2M5U1FYQ3c1?=
 =?utf-8?B?U21IQ2svSmw3dVRrdmlzc1Mxd25WT2VBK0g0Q0RrTXZSUndoTi9SM09wbzhR?=
 =?utf-8?B?d1FpcTFRRGt5TFlBUW42WDJOT251MGZqN29NbERrUFhvNXl3UzF4Vy9NbUxh?=
 =?utf-8?B?OUNFSEZhWWZGemgyeWZNS01kLzVXb3haTjErSzNaSHpNWldVV1BWN2J5dEFi?=
 =?utf-8?B?Vyt0bFZ5aWRjV2JFcFZnMmF4cWJNWkJyT0VQdGF1cTV2OUhuZWJ4MGpXVDBT?=
 =?utf-8?B?ZVo0Z29NU1MxNFJQdncrcnViNjF1SW1uZkxuNjRiUXpZNE5HWW1Lb2V4dndJ?=
 =?utf-8?B?bVI4VU5YMHNObTRBQXpKL0QwTW5lVkRNeTRtbEJEbGxoeDhQbzVzUVBzZVVu?=
 =?utf-8?B?U1VPbWYwZGhlOUpWanJhWDIwNzN4SzFCcVJzTGFRbmpxY3pTQ2RYODVxVHI5?=
 =?utf-8?B?KzNicDE4RjFqeFUvMktsWG9KMnFnNm1TamhzMG1zUXdRZjdKcitqME9zMEo2?=
 =?utf-8?B?YkZvOUJxSUpqOVdQSmN2N0draGlQYTl3U0M0TWpNTk9JaFp6ekxlVXlmTUti?=
 =?utf-8?B?eDFYRVJqVndTQU5Od1JuMkIxS1U4SjZtNktyMGxLblpxcHQ0YkJvQ2lQcFk5?=
 =?utf-8?B?Mk5qVzhPMmRqRUVKSVE5bHdUSlNYSHY0ZXh2VjFIMGY1T0ZqZGplSCtPeEtm?=
 =?utf-8?B?Rk90cjFtM2U1bHF2dE9RUHZRbEpuMVdVbnRNZzRxbDNQa0FyQnFQaUdTTWRh?=
 =?utf-8?B?Z0Q4QW1Ndm83VU9yVFdkOEk2MnN3RVdEWWoxTEFQN2lnSTZ6Mi9CZ2lVczJF?=
 =?utf-8?B?WEVKb2RwakNtVmkwdHBpSjA5eWhiTXQ3aFJvSWtFc2M1dzY4TGl2dHRTdUda?=
 =?utf-8?B?czAxQTRBNnEvNUVEQzlIL2JJR01LRmpIQlgxYkV2U2diRUJMM0Ztais1RE40?=
 =?utf-8?B?WGRDcnEyOC9wdHZTTXhnaENHeFlyc2JrTzJPUm51b2lEQ3kyVlJYNjdyMGJ5?=
 =?utf-8?B?TWI2Zk1nenROSTk1WEhtbXBxU2VaNjFPV0QwRStWZjNFcHF2T2JCZTVTSGZS?=
 =?utf-8?B?SHZOZVd1YXg2dHRyUUdIcmV3K1B6VG5tNWQrOE1LTFZneE9TV2FHYnJPVGFj?=
 =?utf-8?B?T3JaWStWMlEyZmExaG9OdmcrV29Ldm5YakY0dzI1MVZITXNWUW5NajY1d2pm?=
 =?utf-8?B?ZUJRZUxwZ1RKdGNjc1A4aWV5NW9aUWo3MzJvcnNEQ1JRRzM2UVVhcTlpMjg5?=
 =?utf-8?B?djJ0UWN0T1E0dzNRdlFyeXRvMURJeTRpRlh3djBNTDdCaHVrWXhqOTRMRVRX?=
 =?utf-8?B?VENleHhKeEpEUG1Lbmw4cjQ1Q01Ya3o2dS9Eb0t2ZUsvZVljdG9na1ZqNkFR?=
 =?utf-8?B?blBqSUpqdFg0ZlZFMUJ0ZWVoSVpHN3duR1h5ZFN1VDF6b2hYbGsvbGhkU3ds?=
 =?utf-8?Q?jQH1Mtdk3BlVIpbxeCcGwPo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aebba05a-a01c-4155-29bb-08dd766e8aae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8473.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 07:25:30.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGvu6GlURK1iewLAOUQ5gTJJahfPwWTlaz7s2k0cG6c1LSHbdNU8WTcqsPRSYrqIDcwCw4WLa24qkQHUuWwAWx8MUFYiqwUyHilyuFOic7lKuNBds3qYCPyd6ewOyfYM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846



On 07-Apr-25 7:03 PM, Daniel Lezcano wrote:
> The S32 platform has several Watchdog Timer available and tied with a
> CPU. The SWT0 is the only one which directly asserts the reset line,
> other SWT require an external setup to configure the reset behavior
> which is not part of this change.
> 
> As a side note, in the NXP documentation, the s32g2 and s32g3
> reference manuals refer the watchdog as the 'Software Timer Watchdog'
> where the name can be misleading as it is actually a hardware
> watchdog.
> 
> The maximum watchdog timeout value depends on the clock feeding the
> SWT counter which is 32bits wide. On the s32g274-rb2, the clock has a
> rate of 51MHz which result on 83 seconds maximum timeout.
> 
> The timeout can be specified via the device tree with the usual
> existing bindings 'timeout-sec' or via the module param timeout.
> 
> The watchdog can be loaded with the 'nowayout' option, preventing the
> watchdog to be stopped.
> 
> The watchdog can be started at boot time with the 'early-enable'
> option, thus letting the watchdog framework to service the watchdog
> counter.
> 
> The watchdog support the magic character to stop when the userspace
> releases the device.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>   drivers/watchdog/Kconfig    |   9 ++
>   drivers/watchdog/Makefile   |   1 +
>   drivers/watchdog/s32g_wdt.c | 313 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 323 insertions(+)
>   create mode 100644 drivers/watchdog/s32g_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f81705f8539a..4ab4275ef49f 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -792,6 +792,15 @@ config IMX7ULP_WDT
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called imx7ulp_wdt.
>   
> +config S32G_WDT
> +	tristate "S32G Watchdog"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This is the driver for the hardware watchdog on the NXP
> +	  S32G platforms. If you wish to have watchdog support
> +	  enabled, say Y, otherwise say N.
> +
>   config DB500_WATCHDOG
>   	tristate "ST-Ericsson DB800 watchdog"
>   	depends on MFD_DB8500_PRCMU
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 8411626fa162..d0f9826e32c3 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
>   obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
>   obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
>   obj-$(CONFIG_IMX7ULP_WDT) += imx7ulp_wdt.o
> +obj-$(CONFIG_S32G_WDT) += s32g_wdt.o
>   obj-$(CONFIG_DB500_WATCHDOG) += db8500_wdt.o
>   obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
>   obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
> diff --git a/drivers/watchdog/s32g_wdt.c b/drivers/watchdog/s32g_wdt.c
> new file mode 100644
> index 000000000000..f7e44c39aace
> --- /dev/null
> +++ b/drivers/watchdog/s32g_wdt.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Watchdog driver for S32G SoC
> + *
> + * Copyright 2017-2019, 2021-2025 NXP.
> + *
> + */
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define DRIVER_NAME "s32g-swt"
> +
> +#define S32G_SWT_CR(__base)	((__base) + 0x00)	/* Control Register offset	*/
> +#define S32G_SWT_CR_SM		(BIT(9) | BIT(10))	/* -> Service Mode		*/
> +#define S32G_SWT_CR_STP		BIT(2)			/* -> Stop Mode Control		*/
> +#define S32G_SWT_CR_FRZ		BIT(1)			/* -> Debug Mode Control	*/
> +#define S32G_SWT_CR_WEN		BIT(0)			/* -> Watchdog Enable		*/
> +
> +#define S32G_SWT_TO(__base)	((__base) + 0x08)	/* Timeout Register offset	*/
> +
> +#define S32G_SWT_SR(__base)	((__base) + 0x10)	/* Service Register offset	*/
> +#define S32G_WDT_SEQ1		0xA602			/* -> service sequence number 1	*/
> +#define S32G_WDT_SEQ2		0xB480			/* -> service sequence number 2	*/
> +
> +#define S32G_SWT_CO(__base)	((__base) + 0x14)	/* Counter output register	*/
> +
> +#define S32G_WDT_DEFAULT_TIMEOUT	30
> +
> +struct s32g_wdt_device {
> +	int rate;
> +	void __iomem *base;
> +	struct watchdog_device wdog;
> +};
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +static unsigned int timeout_param = S32G_WDT_DEFAULT_TIMEOUT;
> +module_param(timeout_param, uint, 0);
> +MODULE_PARM_DESC(timeout_param, "Watchdog timeout in seconds (default="
> +		 __MODULE_STRING(S32G_WDT_DEFAULT_TIMEOUT) ")");
> +
> +static bool early_enable;
> +module_param(early_enable, bool, 0);
> +MODULE_PARM_DESC(early_enable,
> +		 "Watchdog is started on module insertion (default=false)");
> +
> +static const struct watchdog_info s32g_wdt_info = {
> +	.identity = "s32g watchdog",
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE |
> +	WDIOC_GETTIMEOUT | WDIOC_GETTIMELEFT,
> +};
> +
> +static struct s32g_wdt_device *wdd_to_s32g_wdt(struct watchdog_device *wdd)
> +{
> +	return container_of(wdd, struct s32g_wdt_device, wdog);
> +}
> +
> +static unsigned int wdog_sec_to_count(struct s32g_wdt_device *wdev, unsigned int timeout)
> +{
> +	return wdev->rate * timeout;
> +}
> +
> +static int s32g_wdt_ping(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +
> +	writel(S32G_WDT_SEQ1, S32G_SWT_SR(wdev->base));
> +	writel(S32G_WDT_SEQ2, S32G_SWT_SR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val;
> +
> +	val = readl(S32G_SWT_CR(wdev->base));
> +
> +	val |= S32G_SWT_CR_WEN;
> +
> +	writel(val, S32G_SWT_CR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val;
> +
> +	val = readl(S32G_SWT_CR(wdev->base));
> +
> +	val &= ~S32G_SWT_CR_WEN;
> +
> +	writel(val, S32G_SWT_CR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_set_timeout(struct watchdog_device *wdog, unsigned int timeout)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +
> +	writel(wdog_sec_to_count(wdev, timeout), S32G_SWT_TO(wdev->base));
wdog->timeout should also be set here otherwise the following sequence 
will fail for userspace:
- ioctl WDIOC_SETTIMEOUT != 30
- ioctl WDIOC_GETTIMEOUT

Second ioctl will return 30.
> +
> +	/*
> +	 * Conforming to the documentation, the timeout counter is
> +	 * loaded when servicing is operated (aka ping) or when the
> +	 * counter is enabled. In case the watchdog is already started
> +	 * it must be stopped and started again to update the timeout
> +	 * register or a ping can be sent to refresh the counter. Here
> +	 * we choose to send a ping to the watchdog which is harmless
> +	 * if the watchdog is stopped.
> +	 */
> +	return s32g_wdt_ping(wdog);
> +}
> +
> +static unsigned int s32g_wdt_get_timeleft(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long counter;
> +	bool is_running;
> +
> +	/*
> +	 * The counter output can be read only if the SWT is
> +	 * disabled. Given the latency between the internal counter
> +	 * and the counter output update, there can be very small
> +	 * difference. However, we can accept this matter of fact
> +	 * given the resolution is a second based unit for the output.
> +	 */
> +	is_running = watchdog_hw_running(wdog);
> +
> +	if (is_running)
> +		s32g_wdt_stop(wdog);
> +
> +	counter = readl(S32G_SWT_CO(wdev->base));
> +
> +	if (is_running)
> +		s32g_wdt_start(wdog);
> +
> +	return counter / wdev->rate;
> +}
> +
> +static const struct watchdog_ops s32g_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= s32g_wdt_start,
> +	.stop		= s32g_wdt_stop,
> +	.ping		= s32g_wdt_ping,
> +	.set_timeout	= s32g_wdt_set_timeout,
> +	.get_timeleft	= s32g_wdt_get_timeleft,
> +};
> +
> +static void s32g_wdt_init(struct s32g_wdt_device *wdev)
> +{
> +	unsigned long val;
> +
> +	/* Set the watchdog's Time-Out value */
> +	val = wdog_sec_to_count(wdev, wdev->wdog.timeout);
> +
> +	writel(val, S32G_SWT_TO(wdev->base));
> +
> +	/*
> +	 * Get the control register content. We are at init time, the
> +	 * watchdog should not be started.
> +	 */
> +	val = readl(S32G_SWT_CR(wdev->base));
> +
> +	/*
> +	 * We want to allow the watchdog timer to be stopped when
> +	 * device enters debug mode.
> +	 */
> +	val |= S32G_SWT_CR_FRZ;
> +
> +	/*
> +	 * However, when the CPU is in WFI or suspend mode, the
> +	 * watchdog must continue. The documentation refers it as the
> +	 * stopped mode.
> +	 */
> +	val &= ~S32G_SWT_CR_STP;
> +
> +	/*
> +	 * Use Fixed Service Sequence to ping the watchdog which is
> +	 * 0x00 configuration value for the service mode. It should be
> +	 * already set because it is the default value but we reset it
> +	 * in case.
> +	 */
> +	val &= ~S32G_SWT_CR_SM;
> +
> +	writel(val, S32G_SWT_CR(wdev->base));
> +
> +	/*
> +	 * When the 'early_enable' option is set, we start the
> +	 * watchdog from the kernel.
> +	 */
> +	if (early_enable) {
> +		s32g_wdt_start(&wdev->wdog);
> +		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> +	}
> +}
> +
> +static int s32g_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct clk *clk;
> +	struct s32g_wdt_device *wdev;
> +	struct watchdog_device *wdog;
> +	int ret;
> +
> +	wdev = devm_kzalloc(dev, sizeof(*wdev), GFP_KERNEL);
> +	if (!wdev)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	wdev->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(wdev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdev->base), "Can not get resource\n");
> +
> +	clk = devm_clk_get_enabled(dev, "counter");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Can't get Watchdog clock\n");
> +
> +	wdev->rate = clk_get_rate(clk);
> +	if (!wdev->rate) {
> +		dev_err(dev, "Input clock rate is not valid\n");
> +		return -EINVAL;
> +	}
> +
> +	wdog = &wdev->wdog;
> +	wdog->info = &s32g_wdt_info;
> +	wdog->ops = &s32g_wdt_ops;
> +
> +	/*
> +	 * The code converts the timeout into a counter a value, if
> +	 * the value is less than 0x100, then it is clamped by the SWT
> +	 * module, so it is safe to specify a zero value as the
> +	 * minimum timeout.
> +	 */
> +	wdog->min_timeout = 0;
> +
> +	/*
> +	 * The counter register is a 32 bits long, so the maximum
> +	 * counter value is UINT_MAX and the timeout in second is the
> +	 * value divided by the rate.
> +	 *
> +	 * For instance, a rate of 51MHz lead to 84 seconds maximum
> +	 * timeout.
> +	 */
> +	wdog->max_timeout = UINT_MAX / wdev->rate;
> +
> +	/*
> +	 * The module param and the DT 'timeout-sec' property will
> +	 * override the default value if they are specified.
> +	 */
> +	ret = watchdog_init_timeout(wdog, timeout_param, dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * As soon as the watchdog is started, there is no way to stop
> +	 * it if the 'nowayout' option is set at boot time
> +	 */
> +	watchdog_set_nowayout(wdog, nowayout);
> +
> +	/*
> +	 * The devm_ version of the watchdog_register_device()
> +	 * function will call watchdog_unregister_device() when the
> +	 * device is removed.
> +	 */
> +	watchdog_stop_on_unregister(wdog);
> +
> +	s32g_wdt_init(wdev);
> +
> +	ret = devm_watchdog_register_device(dev, wdog);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register watchdog device\n");
> +
> +	dev_info(dev, "S32G Watchdog Timer Registered, timeout=%ds, nowayout=%d, early_enable=%d\n",
> +		 wdog->timeout, nowayout, early_enable);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id s32g_wdt_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-swt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s32g_wdt_dt_ids);
> +
> +static struct platform_driver s32g_wdt_driver = {
> +	.probe = s32g_wdt_probe,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.of_match_table = s32g_wdt_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(s32g_wdt_driver);
> +
> +MODULE_AUTHOR("Daniel Lezcano <daniel.lezcano@linaro.org>");
> +MODULE_DESCRIPTION("Watchdog driver for S32G SoC");
> +MODULE_LICENSE("GPL");


