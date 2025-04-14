Return-Path: <linux-watchdog+bounces-3293-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EDBA87B7E
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 11:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9D5188DD6E
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 09:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C9E25A622;
	Mon, 14 Apr 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jV2MQoP3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C3525D20B;
	Mon, 14 Apr 2025 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621704; cv=fail; b=cDL5AWuKnyRb2em0CMmeOmbgTbZ8M4KNSBES8Y3aTn46WDiNuTAajmiH/9acixEeehidqhhn9oINn2ZmEtAD9IXF5Y7mAjDbVo2mpaS68L7BhND0/boz7d8XlQ1uNFWgE0zBclSdoKQsqr+5hNWgHaH0YvsDeXt9HKLmkWAFxdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621704; c=relaxed/simple;
	bh=YfcaIIpeEZYXUFoHdsf7n885bWEOkPjtatkQ59qgtZg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kpej9xQ9Ati2gT+15dncwqxHJxy2PH1JOfnoePI9BTGS4Jmd7b/goiPCi4KO3jIU2Wz4D08LfEzcHvzCXMxQvE31+DexoIlA1rcldvxxSy+TNBBxGvOdOcQuzaalIyD1Y3YIG+9CUZtRVMtf9bpqIxf8vFVI9i5/p0WxGn5/PCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jV2MQoP3; arc=fail smtp.client-ip=40.107.104.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhmagDXL63QESZnKJ0JgMN3clsIYK16Y7S4z/T6sEGG1xJ7EzHrvtyR7Kxbn9odPn0Zi/bn97jWD2yQdrMzwq26ucIiaUjR8X7S1wRZS5qnAzC7pS9iI1E98waeqV2TUiScjpLka+wy3t2TR0rAqlirLqA/9eEq04xBBQfw4/BwXlAbKZxaENdEIZJMC7EXA0F2scMYkSWMDiSLGK13/90IFypBcj2BGL5smyFsUIgil+S5DLu8p4Ul3e1WwOzE7uQujmlOrTJEhs9JPdhgG9DYLdcaHBuGydSiczsR9IC/3GdL9KNK6aQwInZtiNY1OOXMDZWR74LuvIckg9gNhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG84NqgvshC0wCixgvM5YGwMDpDQmDHci0nTw5dRFU8=;
 b=QfkWX2BAFIHHMRo0gpozic5mciO9ko5D4iRYhl3nQpKUDshVi7Wb+xCPz4TzmesQMmANtWjg3MUggvj9ToJdYEKsZB/F1TpzXSbNrNn89GaYsdWtRK8matS4zFS/hmTu/iPWAGMTST+zauj9at6BgBxcqdzW6RjzrfL6w0bNa68fxFT/h0o6jyq9BG9xV2r3rwkPj12BkWlrZKDxMroWP75WuLU036P8gHAehRbYp5Up0K/LfOHxgBf3I2wtpGVUb0jpJGjZgv7UZxgHlZBsum1FGixkgmHnBUXd5X+OXqJ4vl1yINwPiyHRfXIH+X+Ow6G/tOUBjCEbBRycPI2RhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG84NqgvshC0wCixgvM5YGwMDpDQmDHci0nTw5dRFU8=;
 b=jV2MQoP3qUWuPV0ZdXE7f5jknKyGhJBo+7H4JaG/KRJrfm9ZDpvTpVqhT6wTMhKaKgS9LLHjJnyvuYftfW+kAGqtk9uJVK7Uox+zL+0fYgRYHJ6CVmAgdQn+R2x/R0PZ2vJ7YwMTT+p7agl6nJIQA0feOEugtoWFB6y4ti+13OA3MWNQ6c4DEOAbiXWITQrtm8KUxqpEk/EymjPoPJmPaP0dkPyy4YIuxzsny4CQYhOv7hx19sRGE/r0aCoUV30vk6Ja6EhwG0UgbyrvyavvKju3cKnnwpi8eZ4nGTwerc4UGLM3/XX8UQCJQGtQWoIZGeeR49prYcxCs3kw4BLnEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 09:08:18 +0000
Received: from PAXPR04MB8473.eurprd04.prod.outlook.com
 ([fe80::2a15:12f0:d937:151a]) by PAXPR04MB8473.eurprd04.prod.outlook.com
 ([fe80::2a15:12f0:d937:151a%5]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 09:08:18 +0000
Message-ID: <eec4a6e5-0940-40d3-9d64-0334640f4c56@nxp.com>
Date: Mon, 14 Apr 2025 12:07:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] watchdog: Add the Watchdog Timer for the NXP S32
 platform
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <20250410082616.1855860-3-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
In-Reply-To: <20250410082616.1855860-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::10) To PAXPR04MB8473.eurprd04.prod.outlook.com
 (2603:10a6:102:1dc::15)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8473:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 20cba6a7-dbc3-4bfb-1de3-08dd7b33e556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWxPcTZ1bmtmSTFUREQwK2RDRjg4UXFnTys4dWZHTXVCUW9hcjBaWmppRHg5?=
 =?utf-8?B?OVEwVFFGVnlCaGd5dGk3NVJ1U1NaZHhUdUczaXpCQnRVQWlsaTN1bTJuKy9S?=
 =?utf-8?B?TS9mQnFvWjRmb093QUVXTHlrV3k0eXFNdm5vUXAyU0diK3ZwWmYwWXRscGIy?=
 =?utf-8?B?L3BCZnZTZDBsYWpLVXY0VU1YWlpmYmNjZndCS2FLWW1jTFpsMnBCU1lJelZr?=
 =?utf-8?B?UVAzclRYOElJQVByUDk1cHRPWGZ6MTJCNjBhWStXbndhZTVIdEYyNzZtb0pt?=
 =?utf-8?B?VjV1aUpqMjc5RE44cDZvZk9pN2g2TElodUduNE9RZEZHZWUrV1pTdUg3VnBn?=
 =?utf-8?B?S0pGcGUrYTdmc3JwSHNLdjlVdDRrQXZLN3hiNGFNa2tTOUlGeWlxK1Vlanhl?=
 =?utf-8?B?dXBOQjRLMzFIaGd0aHRDZExxbFJGRVU4SUtscXA2akNFMmpzOElvNkt4ME95?=
 =?utf-8?B?bW42NnRYS3VibWhkREloQ1BNb1N0aEFZcU11OS9ITTdkRXArdC9rMmg2YXVh?=
 =?utf-8?B?aEQzVmJBa0Zzd2w5TmNNMnpVSFZZVmJwaVNrQjVGNzNMUVFReGUxR0NXenpC?=
 =?utf-8?B?aUprUGpaVE5Tc0oyYVM5cGE3aWh5WFJZeTJoQTNjcnFWMk53Z0hFY1J4YmZH?=
 =?utf-8?B?WmRPODA2d3JNc0xCNmE5S05QcU9ta1N0WnMwYzV5aFBIOTYwdkk1V1JyVW5r?=
 =?utf-8?B?amtBMW4wWitZd0ZnV3YvTzdCRUV3SFRyNnJQYVBVMjBJWHdiejJDeU56Y0pm?=
 =?utf-8?B?VTVjSEk5NCtMR3Z0d0picVZNU3ZMSUF0SUNjV2tTNHRWb3NjVnAwNUhTOXds?=
 =?utf-8?B?Yzk4VVl4VG4xc2I4KzJ3QndIZytleUtpNklaNkRodGcxUmVWS3cxZnFRaVU2?=
 =?utf-8?B?cGIzbzZPSDFXakpEUm5HeVVORUVYMXF0Q2gxS3cvdExULzBxMWNxZkY1OGRU?=
 =?utf-8?B?bGFka0NuVGlsMEprZGN4d2ttUHljUjFUcDNWN1hPdlU5SXBlcjBiSVlYTEh2?=
 =?utf-8?B?cSs2QTFUalpGYWhEcW1vUjZpUExienNSeVpvcEJJZnZWR0tvb0NVbGszMzFr?=
 =?utf-8?B?TCtybFdxL1paUDFpS0ZObFVmRFA0ang4OGZqbGlrcC9oaUFzaEZkNzUxNEl5?=
 =?utf-8?B?OHphNjkvUExLZ25JVDJIQ0RlNjI1UXNwVkFGUndUb2VLTzNTekdOeDdCakJE?=
 =?utf-8?B?SEhZQm9jS2NsNlZ6ZnVpUyt6SkI0UjJTZmRaWWluZ2d5cUFMemZpZ3FMVURa?=
 =?utf-8?B?NVM1WlYzU0RvWCthbmVaMUsvTXNSN2JjZWpHR25YSHB4TFcwSzJqRjJlUXBB?=
 =?utf-8?B?UnR2S0c4c2Q1TDQxcjFXa1VMZWdvazY2dWRycnZaeWpEQ1UwdVpRT01GVXNs?=
 =?utf-8?B?VW9mbEpoTXZSZWpXK2JTcFVNa1BOTnNSeE1DV08vMk14TmtHaFVHNzlNSVZp?=
 =?utf-8?B?aUhtcDJFZzM1cCt1OElzQ21ubWI3TitDN3RtM2JiRkJFbXZxWWJ2RE1xNXdU?=
 =?utf-8?B?eXlNTUQxaFZRVDN4MDVjZzA2bUZEbGY2NldxcEJuRkVSQUdCaGc0bzhKTFdq?=
 =?utf-8?B?dzdieGlvWEt2MVN1M1JLOG4zQURjZUk4NVVsUlQzRVdlNXc3ajhERVY0VUhI?=
 =?utf-8?B?dk55RGUrQTBFQnRDeWZqc2lSMEdEV1NUSFNlS09rNXVKV2JmdE00blZhRkpB?=
 =?utf-8?B?VitHa3hvZVI5MHZHbzBwMlBObWcyODhnaE9Idlhxd1RyR1d4QlUzWVNpTWl0?=
 =?utf-8?B?bTdUMi9GV2NwaDlvV1BzQWtTbU9CSjhWaFNNTkUyZTVKMlNuVVlTRVp6YVZI?=
 =?utf-8?B?RkxkZWxkSWxlcHAraGVGS0xxY0c2MS9xUG54V0VTS3dXbFQ5RkZNSERKVE8x?=
 =?utf-8?B?OXFMdmRJRW00Q24zbjhnOWtsZHAvdUdINnRUenlMNzdMYTF4NlZ4VHRyTEN6?=
 =?utf-8?Q?wnVZcLuEDvo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8473.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDI3ejQySUpDWVhYSDdySVFlY2VBLzErZ3BTekhSMnZHZWRNRnZNdk5tMmk2?=
 =?utf-8?B?cEJSNC9zL0pUdUFTU280TUVkSTUvcWFzaE1IbWFVQ2l0ZG5rWS9WckhXTk5Y?=
 =?utf-8?B?U3BGdG1kcFR0dEV1MHZnbVZMbGdOaDVQaFg5OEdsMEkzRFVTWGRLZ08wLyty?=
 =?utf-8?B?YnR0ZndQNmJqaURoazg0SmtpZUg4dm9DWG44VUlVWkh5aFNORUc1d2JlVE9t?=
 =?utf-8?B?eCs5TFNNZVpkS1lrMHdGNWRBTnp6YU9sQXJRdFFTVDlWRUxKcUxXNGQrVmRE?=
 =?utf-8?B?eXNyWFFzNm1sMlUvNEl5UWVoTkZzNEZhb1psNFoxUUYxNmhoQmJqZmpSSHZH?=
 =?utf-8?B?SHRFMG1WdzZTZzlWdjVpb1RHQjJjS3ZXWXIxOXZnV3lMR2p1cS81VjVKUmRk?=
 =?utf-8?B?ZngyU2NIWDdFSm84NnZIR0NQNVlxUlNaRmNFMExickpGZldQNCtxbm56WnRL?=
 =?utf-8?B?eUsvMlhLZEpFc096UFhHVFVoZU1ET3NJeGozMzNFN1FNcFRpU0hmRGJIaVZx?=
 =?utf-8?B?WDZJR1RUTERnWklTSHZYcGV3WDJld0FPN3djQy9mRlQ0MDkrUlVTUWR0dEdC?=
 =?utf-8?B?MFY1VWRXcnBUK0xpYWlzY3Bndy9lU3NqbjB2K0NHa1FQSFV1aldqTS9xdk9t?=
 =?utf-8?B?V2x6TFlRMVVYRmZXdjRYOVdLVk0yVCthQmJWWmFTSHhiUGlCTFF5ejZFREhh?=
 =?utf-8?B?TWRpLytFWXgrL2R1NXNwOHk3enNVUEpMZ2drM3VZSkRqalMzcWYwMitlOVlX?=
 =?utf-8?B?QmRKYzFqN3psc3M5VnRsVWtBV2dKK1piNHhyODdrdHJIekdQNUdreUlSU2ts?=
 =?utf-8?B?V3ZjbWM0Z2Z0d1ZDUVdOdkgyd3dxanc5R2dCM1FjZFh4L2c2Yk5ubGlOS1JQ?=
 =?utf-8?B?YmdvZTdhWXNpYWtKekE0SUw2TmhuU3R0RElYV0xFckIzRVRLemlTTk5kTDVi?=
 =?utf-8?B?dGN1d0ZkOHdlVGZSL3Rhc2NRN2EvSGl4bWtzQU5FdEt1MlQzV3Nzb2lKQ2xr?=
 =?utf-8?B?VUVZdWc3UGgrdEZlT25rWmhPMkpzRXpXRm81NjIwUzVXdEs5b3FJVWdVcWdw?=
 =?utf-8?B?a0t2bUt2TTJiQjJWYlJteStIRFR4WDZETlhnQ0JDUXZzZGhMQmdyMHRLZ0lZ?=
 =?utf-8?B?NlNJa1BHd2J2b2tPRFpFY2ZaT3JHT3JLeWhwU0J0akJlODU4UlduZ3VsQ3ha?=
 =?utf-8?B?a09sUnR4VEkvK29QUHkycXJNZlAxakViM0crd1N6SUJKSHh0MElZYkRZcHZi?=
 =?utf-8?B?UWNDc3VQWjRKbi9pMlQzUndHTENMSERocHZQZ1JTRzdWSFZtRHo0RUdMeWJ1?=
 =?utf-8?B?OTdYQUg2T1pNQW5SdFhva2N3dEtldm8zdlI2WWQ3S1o0Q0IybVpkeE5OblFu?=
 =?utf-8?B?YU5hZ3dUZ2JMWk1qdHJQQ1BLY2J4enJjU3FUdnlDWmNzVXA3elJ6OGJacUhr?=
 =?utf-8?B?TytuTUVOSDVFL0MzVkFnYmphZHNIYTVSa1VlbE1aVDRvV1VOYVRsR0xaWWJ6?=
 =?utf-8?B?SkNpc2hRc1RCcVlIUXZ5bytLN1F0VWV1S2k5dm03K21GbXJuRHRqYzJOMXpa?=
 =?utf-8?B?b0E1YW9EVVBFRVcrWlIxYWZDN2JxY1N2cjY3TnZINFhkMlcySVZremFyMDdB?=
 =?utf-8?B?a0h2RElDaWExOC9TbkI3TnZwRXZPRkdCL295a1RYbnRrdHR1RG1OT3JwR1ly?=
 =?utf-8?B?a1MyVmtZbC9vaFVPRjVQcmVoQUcyLzVsQVVJK1V1Y3J5aVZtbEROOWZ1dUVW?=
 =?utf-8?B?a0R1Q2F4eGM0Q1BUZU9WRTYyc2xhUVJoZ043ZFlpUmNSUURxeWxkVEUyNEdC?=
 =?utf-8?B?anRBcWhsbldiOWlBcHl6ZzZ1T1FHTWVza1RrQ1BvTXVYZUQ0OVh5d0ZEeFVk?=
 =?utf-8?B?VzZkeEhSaS9aalVveGxJci9QUzlpcWhrMjgyeWQxZS9wTWNrVnk5WGp4alBh?=
 =?utf-8?B?cGNZUzRvTEFjakoxVnU4SFZrd1lLNjBVdVlqaWhTTmV3K0hCbmNEaHdvcGpI?=
 =?utf-8?B?NmZtV2RNWHFhQzRiZnFFenMrSlVBSjUvNHpWUVdHcTV3U0JNc3dWeEdUdkkv?=
 =?utf-8?B?QmJjaVpQOU9MQ2p4emUzOWVTZjdZM3FqMUtSbWFKVnRFcWhXWUZ2N3I4Q3R4?=
 =?utf-8?B?R0ZoVXBXeGlhbkRqeHp0V05qSG9wYXYwUFFzelI1eDRWRXdKSzBvcWVOWWw4?=
 =?utf-8?Q?Ah6C8YBiBnbE4b4gei0EP+Q=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20cba6a7-dbc3-4bfb-1de3-08dd7b33e556
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8473.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 09:08:17.9855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4HwucwPIuFt9DLhtuOhS2G8TM0IOahJbgclbaPUjTJruZrfqi1mG7nA2Oh2ClI7RY2qLIgAVhkBGv2NxB68S6cBNP02ujj5upvoHteztPkAhpTagBSIWA/Pu8CO8Co6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264



On 10-Apr-25 11:26 AM, Daniel Lezcano wrote:
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

Tested-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>

> ---
>   drivers/watchdog/Kconfig    |   9 ++
>   drivers/watchdog/Makefile   |   1 +
>   drivers/watchdog/s32g_wdt.c | 315 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 325 insertions(+)
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
> index 000000000000..ad55063060af
> --- /dev/null
> +++ b/drivers/watchdog/s32g_wdt.c
> @@ -0,0 +1,315 @@
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
> +
> +	wdog->timeout = timeout;
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


