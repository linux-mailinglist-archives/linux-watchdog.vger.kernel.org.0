Return-Path: <linux-watchdog+bounces-3861-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C5B03CA3
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 12:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A791650F4
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 10:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED7223D2B4;
	Mon, 14 Jul 2025 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="PWnFF2Ji"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023130.outbound.protection.outlook.com [40.107.44.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51412239570;
	Mon, 14 Jul 2025 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752490533; cv=fail; b=peaUbUNdBMIpsYT7cbk2XoVaZ9FECjD8YAl3YQz/Bijz9YZ6Ey8r5B/cfARjkHoY9tmJmjpBIZzfoY3ztlkfaNnr0HGvLrxd/QEUGylLQREH5NZio0UOYpAT6SNKma89Ni8WdSkg4fpBAQIpoMxD1EtjL0hsQ5+L7zvkP3I4TY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752490533; c=relaxed/simple;
	bh=L/Eod2p+rOWVzb/h53epRkeSO9cNx1uJTCfDsTt/r0g=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=d3ugkoaN9ywngJUNw8giUGPWRhyqeWxFCQejrdnWeyhcOZ3NDK/KDPFFiMWqM+CSGaASHfKHtX1+dDmDiO0PKDI4zQ4IVQmvyYNLTfcVEG3ybzCRchwdzHThzsiy3ZWgkvLbyBLn24YNBKSRLHHGfTnJ6UFL+RleswAQAMuckBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=PWnFF2Ji; arc=fail smtp.client-ip=40.107.44.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owzlckk3wmOgLFAZZcfqgdqEXnK38jAafsIWE2S15i0MbAAh6wFbX0L+HTTv13W1uI+jfxCxcE/18OBLgHxM6O3Kn5rjbGai5KpOmZgmsW6DYk8M/zXfeKxJnWisg4EanQWKwdFNER/DLDMdPdp4JARsVfH3Uj/iyuUlq70Tpr/qtLHoWBYvw1sB/V40TdYWUK0lvJmaCBYuIIKXTTgv/iMNs3tkLUhr+Nkn3D3jBNzNGEpc5b64BXNJ5/GL8Ogfk8S6gZX2BNqRMLjrpRW8QOAyi70fjhp661rRxfy/qXNLbjg/pTieJUMvSHoy7zWtanwO1Pekt91JDlaqxwtnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3+E2+znP7ScB2rCRuRsZlSWUayIExNs2Vx4QCzB4wU=;
 b=nz97r6TC4kNbAjL5zaUKHmz78GzO47vZU68sQ8CcNZWT2YQ1eqxogK1xuWc8b5ZM6kpbL7Gu/mi0zB1rQHJOHZeLHW0rMgNe/LTip4sZfMcIT2NSnQt50xrC52UgjFrSaRZ8FNAjiFnEL7FQMRZHEz9n4CGMjkVyF/dByKVIwb/3ppzQEaCKKNnLGwmkN4l3oTvEcMl6AFRwYd48aA3xcGc+Kx9UWu6y+9K90B49zcfZ8fypGtjcO3NvlUFrjwpfJ1LbRd8mekfPzAlqeXIk4s/CqL1vVIEtZ9qQqo3680qYWPfBA2DjCjGyWB/c9WQdjUQO7WfcTE/ovoCfO43kkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3+E2+znP7ScB2rCRuRsZlSWUayIExNs2Vx4QCzB4wU=;
 b=PWnFF2JiaxkK3eQmuhNn0zAdahaqDdeAM5OpRc6ouck8MCJLm2XoXtHq3M4hXIotrkZYUsGszI5s6zhuZ61x0uMdz4zsgZVa9WmUVDGu1SdmrOCjr6m7wUczutdONv/feXSlA21zKxVpjhsx2a7LdL64Ugoosb8zNTKSXVqqFLwKiRuC/eY1UxF9loT1jZER4KmpXFGZWKXrvSr4+Ul/e9ChrhexC5LCYDujTBEFLNkfYh+KoslhKRnzzf22TSLRZZW4sT5MI3fqDBlJWvAHfGdWuV2Z0yGyLL1p0aXoEnLxQ/nAsv3jY1FUZIamV3H1DPHnl+WJLPEQddXcCqLUmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB6991.apcprd06.prod.outlook.com (2603:1096:405:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 14 Jul
 2025 10:55:25 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 10:55:25 +0000
Message-ID: <30c7d43f-0a2f-43c3-951f-7a476c2b32f5@portwell.com.tw>
Date: Mon, 14 Jul 2025 18:55:21 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v2 1/2] platform/x86: portwell-ec: Add suspend/resume support
 for watchdog
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::18) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be423c3-726b-4bdb-2b99-08ddc2c4efe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGt0dlFDOXlxRmNydDRaV3paeHlQeW5hZ3hMdVE4OUtjdjZRZ1EvMEw2WlZ2?=
 =?utf-8?B?RVcwbk5URFBxQ1h1WjBkcmxLTVJmdkZjTWRNSnUzUzg3S2g0TURXNDNKRk1n?=
 =?utf-8?B?QkxwWGdEWlMrbzFvaEkrT3lpZGEzbVNmMHhBenR2ZThsQXF6dzM5ZDJ6RmNr?=
 =?utf-8?B?WlhBTXhZZy9vaEE1OFVod1dMTVRINjNiZGU5QzdMWENkSjdEWUVXTUFxd2Vi?=
 =?utf-8?B?VHQyUndORnpxZzBDOHVwTlFhdFI3bDdBd1QwRDRGS2dVN2c4VlNLMnlNazJR?=
 =?utf-8?B?VFgvcDZsUUxhdFFBelZ2YTV4WmVBdFdvZHNuSWtBNlJva3ZTZVpzWG1KUStn?=
 =?utf-8?B?K1ZuLy94cGZhT1haMHh3MzJqVVNOTW9HVUErc0pUWmZwM2pES2lSckNMc3di?=
 =?utf-8?B?T1BDVXNyREdDT3hocUd0YUNnUEN0RlVUSmMyNkRaRVN5VGFtc0N0TXE5UVhV?=
 =?utf-8?B?bVlobldlZm5HZys3Sk1QVmo5VXNBb0wwV25ybjA1UDBURnplZTJpRit6NFgz?=
 =?utf-8?B?bWFBSTVoaFV0VTdVU2padmVoMWhicHB5aCt6RjBvYkJjUkxKYm50THFHQkQ2?=
 =?utf-8?B?MWFJb2NqQkk1UVpGaEllWWNHdHI4dzE3bTJFKzd2eFNqeUR5SzZNVjlwSGE0?=
 =?utf-8?B?S2NpVFlmVXRkNVVhZWI2eFJIUmk3QXlZNHRLSCs1TTJ2NHJWSDdJSGx2NWd4?=
 =?utf-8?B?enYwaGJ5V2U2clkwQnhYMHRHMGRWaTZLTThEQ1BsUGFTQkhmVWpSQmFTMzJw?=
 =?utf-8?B?UDFReUNpRnljRVU1SVdmbWlzMEt4L2k5a2pIRERia1ZRWGREc2lKclBWWmxt?=
 =?utf-8?B?di93ZjQzTm9iYzVQaEwzRENDSWxNakk4VGNvcVlTY05LRC9EZXVTc29GTUVn?=
 =?utf-8?B?U25EVDFwTFRpcWJEb3h0ZXRhQklzbkhLSmFPbWlFU0orbHBKeWxtSENzeUQv?=
 =?utf-8?B?NzRRSjhjL00zclRsM25tWC9QeTd6S0JkOTNvbnlYNkhheG1yV0RCY244N3do?=
 =?utf-8?B?Q3hyMFowZ0MvaXU1TlJZQWZnNllNN3ZvOU1NYW1YSmY1U2dhbzcvVW5VSW1E?=
 =?utf-8?B?a0hkWXVIOEl4SXRSRjhhdGpiamJMMXZKRkNDQ2RRZ3RmOXpFWVI4QVphTVBJ?=
 =?utf-8?B?UkQ2TG96bGRldFV0c0hoRCtaVDFxeWZidTZyM1R6QzVzUitHTFFNUzBoSUk0?=
 =?utf-8?B?NlVLTG5yV21LekczQ0p3RTBDV1ZhaGhxZTFXa05ObG52RTdJalI0dnRFKzlz?=
 =?utf-8?B?WUpkVFdrUEFsWmcvYUcyck1qVGRkblJ6Q2RvTm1GUFdsRzNLRmtFUkp3S00r?=
 =?utf-8?B?MTNYRU16YWVrd0FEZWdoR3hKRmNIUHNBcnhDNHJzZ0w3cllOaTFsV0E5WGJZ?=
 =?utf-8?B?aWNVK0JYV0IrMVd0RzZSbFlVVlJRVkEveWNGWDJFT1kvbW9JM1NwRXdJSFRv?=
 =?utf-8?B?YU96NDNHVzlsUWZPcjR0aDNEUUN2OGpYV0xablJaNFoweldJVFg3YVpvdTA0?=
 =?utf-8?B?ZVY2clROMzBzTVFlVllpY2xaUVM5Yms1c3RRWUhSSnpDT0doVnpOOTNsQlVH?=
 =?utf-8?B?RFdRUmZwKzdMVGtpU3ZpeU9wL1c1WVA2ZXVZaXZhcU14NTA0WjZINnVGeFRm?=
 =?utf-8?B?UjF2UFRMVXFQK0NaMi9RcHN5dVZxY1pONU4yRHk4TXo0VzlZRnVnczk0bjlJ?=
 =?utf-8?B?aHlqOHVzejFvVzNUdzJhTkVKcjdYMmE2WFZickp5bFVIMEpLWXhCanlUS0N2?=
 =?utf-8?B?eGpOeXV1ZnM2NjN0akxwRmhZSFM1Z2JBekZMZHJiQWNpbC9lMEozQ1E5eTB0?=
 =?utf-8?B?d0hKdGNGamJ1bXhhUW42ZndweWo2OWVyVmM1VzdlL0crdHVubWdpVno3UlpW?=
 =?utf-8?B?TDZBVVVYOEN1dUd5dDFPbnEwN3VGQVhPVlB2eFk2elYrS0xFQXNlSXZsd0Ns?=
 =?utf-8?Q?JR8chzbfBg8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3EyMmFzZnp4WldTQll1c0NXRFhzTFZtdm8xR3g2aDd5RkdaS2l3UnpNZ2Rv?=
 =?utf-8?B?SW0wT0ZPZzB6VkkyTlFOVkplRURITWVFdmlEWGsyTTlHSC9EUmtlTVhmRVJn?=
 =?utf-8?B?cW9PaHRjNWtWK1hncWtGRjRXckl6c0s5dmxVdVFGSEg4b0Q2RmpJQVhydjdn?=
 =?utf-8?B?WkRFWHFQZ1Z6RS9kUUxHaXN1U1lhN3E4WFhKQnFSendrT3VVSlhDNlN6VzFB?=
 =?utf-8?B?Z25pd1NNMnp3Qk9wZmNwZHJmYnBXVFQwZWUvQUVyVFVOWUkyYlprT29tSVM3?=
 =?utf-8?B?RjN5ZkRwMHl4NlcvYytQOHorcEpJU2l4Yytsb2N6S3UzOXdRei9aUzJ0VDlR?=
 =?utf-8?B?bkd2QnhKdFN1N1FkYmdxR1pYWStpeHJtNTJyVjd4czB0eVFNQUVaS0dWdTNH?=
 =?utf-8?B?akZ4MExOS04wYWdaaDd6WXk1YUhhZFFpcEpqYytxM2ttUzNlUlhkUHpBZ041?=
 =?utf-8?B?WXJMWEJYQU00eWxMTmZjQkN0alVjRGduR0lWcWVERmxwVTUvQW0yeWFIZFNX?=
 =?utf-8?B?QjNpcmRTa0wwc2twUjR6OHhLMy8yM0lPbmdHSnNKdVkvaUhoOS9yeXFuMWJH?=
 =?utf-8?B?TjhkcG9RM0MvOFlBZGRYcVRkL1NkZ1lnd20wdzlPcmZxMHlMU2pCQjd1SzJq?=
 =?utf-8?B?NmNUckVUSDMvZ1EyWlozRk1ReGtOUnV2UncyTTJxcC9kU2JobHdLSkFWOWYr?=
 =?utf-8?B?NkNuc3V0YXBwY2x3NFN1eUlrb0o5blU4dDNndnF4em1uUTdEMytWdU80YzRu?=
 =?utf-8?B?eDUvOTZEaWVXTWFleU5mZmo0cExCbVNqY3licmQrcjhmMGt5cExPT2RNY3Ar?=
 =?utf-8?B?TUFyVDROQmlKLzN6SjIwYTliNDlXTkoxSzVCYURGaGE1VDFuNnBSdnY1Vzl5?=
 =?utf-8?B?bnpmVGFFSE41aldLUHUwSFA2eGdVS2pycHRDcWtBN3c1QlZ5NFMzTktMdzgz?=
 =?utf-8?B?UG9kQjB4OG9sajhnUGJWNXFNQkhTdFNzWlJReUhmSkZPbm5KYkhMNVN6OGNi?=
 =?utf-8?B?bmdhWDNneC9hU0FMWXZvSzEvSmw3enl6YVpDS2YxSUxiUkdOeFlPbGttbFdz?=
 =?utf-8?B?U0hFNXpsQkJNZll1YVFTMmsrb2hCMlZRQXZ5NS9CNGc5dWhEckNBR2ZxaWJY?=
 =?utf-8?B?VTNBejJPMS9qSk1tSko3VUxQZGRib2I0NWo1d0k0QVBtcGFyYWNTY1lMV29v?=
 =?utf-8?B?UGtESk5lcHB3b0JWV0FXdVR5OUgrL1JQRnNGZjR0N2Q1SXlVZWNhSVRwbmJS?=
 =?utf-8?B?a2JyZ0pMMW9GUHJmVzZ1OGdMWUhkY0NTR1B0eFkyaUNjdXk5RFhCbmlQVUxn?=
 =?utf-8?B?cVZmVlBDcFNWeE01aUdxQVE1NlkwV09PQlJyd1l6V21WNFUvTytBbjdYdDRj?=
 =?utf-8?B?eFp6OStQU3RNVjBCMGNtNE5zQUJtZGhTbWxmdGxPS2dBQy9obGd2aVo0K3d1?=
 =?utf-8?B?SGp6NXJEaExybE9CQ3IyZkZ5UHFSb2tvZUJnYUdMOXVrV0xCZUpLeWJRcGk1?=
 =?utf-8?B?QnZIbUViY0Y2aUVTTjgvbGpLVWswaGlrMUJRdHRIU1lPcGN3c1phaFJMR2Qz?=
 =?utf-8?B?Y0N0WlJNelVmWU5kMGNxY0pGS1JGQ29CVFE1dld6OEtWdExkaDkwMU1PMjJF?=
 =?utf-8?B?VXYwZmNQeFZ4NVVGMEVCYnNnQUVoRG1mN3lURG0vUXAxdUxyQm5GY2cvNDE0?=
 =?utf-8?B?UmJ6NzU2OW1PTzZRTStlTXdpeWF5ZUFtWmREMG1RNGRpem13SGlsN2VKTDF5?=
 =?utf-8?B?SGlCM0VGV1BwcndCTlA4OGxTQ2M1ZDZhZTZzcjFLRXc2ckpxL2thTmNiZmMw?=
 =?utf-8?B?MmlYZHBtT3Y3cFFyeVFMYTZtWkxMKzBxL3M5bUh0VUg3QTR3M1NIT3dGQ1pC?=
 =?utf-8?B?UmFDcFZBbmUwNFg1bE9WZEk0Vzg2K0MvL3NJR1daS010R09MZE1kczM1T2dM?=
 =?utf-8?B?SGI2OEx1Nk83djFUWVFqTWpYbWxrLy9XR1VpaVJyRjZieGkwZWQ2UlRuaEly?=
 =?utf-8?B?ZkJ5LytpMHg2dzVVWkFjaUE3bFY1OXNncEUwMkY2OGVsYlNPalZmbzVzcmdV?=
 =?utf-8?B?azRPZllpQXlidjFkZjVSNGozc0R0dW9EWk1uT1FZTmhoNisyOHZjR1VSNVpS?=
 =?utf-8?B?Z3lWNFUrMVAxQjNKbTJ2VFVMR2lkSEpDRk92TUd0ZzRJdnhXWUlOUUNjYmgr?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be423c3-726b-4bdb-2b99-08ddc2c4efe9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 10:55:25.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yM28UkzoL7WruONEayPWr/uFBiYh2KHUJNQoec8ZuxNvg2oP3ho4Pd76Q/mD5Vu28sEJQTsC/w7xGZW5ePzBvRZnzVSlknFuk6xhbXqWGsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6991

Portwell EC does not disable the watchdog during suspend. To avoid unwanted
resets, this patch adds suspend and resume callbacks (pwec_suspend() and
pwec_resume()) to the driver.

The watchdog is stopped in pwec_suspend() and restarted in pwec_resume() if
it was active before suspend.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
 drivers/platform/x86/portwell-ec.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 8b788822237b..a68522aaa3fa 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -245,11 +245,29 @@ static int pwec_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int pwec_suspend(struct platform_device *pdev, pm_message_t message)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_stop(&ec_wdt_dev);
+
+	return 0;
+}
+
+static int pwec_resume(struct platform_device *pdev)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_start(&ec_wdt_dev);
+
+	return 0;
+}
+
 static struct platform_driver pwec_driver = {
 	.driver = {
 		.name = "portwell-ec",
 	},
 	.probe = pwec_probe,
+	.suspend = pm_ptr(pwec_suspend),
+	.resume = pm_ptr(pwec_resume),
 };
 
 static struct platform_device *pwec_dev;
-- 
2.34.1

