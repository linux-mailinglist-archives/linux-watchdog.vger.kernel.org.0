Return-Path: <linux-watchdog+bounces-3872-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4EB04F80
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jul 2025 05:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F31D5611E1
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jul 2025 03:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6C62D238A;
	Tue, 15 Jul 2025 03:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="LveL5ANT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022082.outbound.protection.outlook.com [52.101.126.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1DC2D0C8A;
	Tue, 15 Jul 2025 03:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752551522; cv=fail; b=HL2+5g334K4Ecqa/mpCmTuczdrwx0AdM/VZB3pE0f37Mm7UU+HukMWaQX3remEWLMK6tqasx76SEhZQUBXIpXmmfApjqKZJYg7ENaJygC90C9AwQd6mcMibAZamAbktt5qwd8yd54N9Wwvenbb1mLUL1mbVNP26jAXPif6sackw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752551522; c=relaxed/simple;
	bh=56nqYRGsB778OYyoIIop20111YmjCuCssoNlSFDa04g=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l1/j6NvO2hg+pyTYsykviWNQG6CAMjb55FzWcArcQe2miGyCWIfXfjX4Wk5/jTTY1gJmWnkABLw1MaNKcoFbOKmErVQyM2Da0t5QOeBG6TUodJYLCdq8gDHv0DFMhE3fj2OOo52FmgrmbmV7p2IX4IuYj4T5cv2Pqg+coabHufk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=LveL5ANT; arc=fail smtp.client-ip=52.101.126.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C63ePmDjiO6s0d+WBVtiSRksW/goQdvJiRPlg7RaeH0I3OZ5KziN4umlR5G6l9tRqM1KiGH5Jg3lkXvlfgmz2x8i7UCpnGuv1UDEi3BYqYFwL5Kc8j1Z+Hz2Hm6mkTahUu1ml9qZYSkKrj6QSwfWYW/N5vLh/oD//gFzthmIs2HCTsU8BVjjs5C4KX3RvRUGCR0NsQt5wrMX6N97CVVedxJ7xo5ykW2bVYk+NujV2AQLreFbRcG5Eq67Un1hqfDynAGgXqlu1yC5vnCfNb6ZF4Vd4gpjEmsQuYtoFfM/IER05DXkOhe+fL1WduHQnr5XoPkSCJXmnJKDBtaiCvccvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dz+EGPRNCxLlDpNbc7U/xUrEKDT1FYDy34R48jYx6Fg=;
 b=tPQcNYnTJzo7e+GWzi3qN0JXP//HLiO3msUNwVzKlC/oIGBxcNZ7VE//I7i1yo46xyP3GvOfXvcGmmTdWXLOo6dhNJ7SRB1dgpv6qW+rJ5la/R7GM5a6/sGoKxnjcqzOxN91BotS92ZRb9af7NOZnvnSI9LBOFMiOAZQRB9cqKlKzRoe6SchOISlsl7nJV3Ri9E4lO9834qcSHsEFaLM4FsVEqxBuV0PgSdP4/rhBb+0nlcBT1ybnDGTIA92DcGCj4Ug4VhB/q49Cz9Maq9jhm4FP4JfwmOYCd4IRAFHY2E8dsO47ux/RYDSIThuIhZgIuDs9hjZkPb37uqjNXbf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz+EGPRNCxLlDpNbc7U/xUrEKDT1FYDy34R48jYx6Fg=;
 b=LveL5ANTZoYynh0fuy0K6BblV0r1joMZ4nbL4IIIMOkgkJ9LMGePzPbneLyft3BVr4whXVfV9/RtDv1RAP/CMZU4YNQQWqmovpaTaiC0B1AYEHRb6mlgm0dLaptMCLoudvo90iwL8KZdNO0TJt5tRqqwvOyqb7B6mDnBiURivy1T1xBLyml9FCubMX9FjESlaB4xK3KQfK44T2/WyIzRn6xULlI2W8f93mMAbgXzuKWoQZcOsTBwcSUcedKdbA12bpXyC13UYxKRxz+o1dvdaQz70fF6OSpyqSptTUpUsRrSbKcUsiEgjEiOGYBkRXsuKLEjL2eDrFMnGtWV2aOLzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB6748.apcprd06.prod.outlook.com (2603:1096:400:464::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 03:51:55 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 03:51:55 +0000
Message-ID: <ef9455cc-1bc3-4e6c-a445-047127cdfbc7@portwell.com.tw>
Date: Tue, 15 Jul 2025 11:51:51 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v2 1/2] platform/x86: portwell-ec: Add suspend/resume support
 for watchdog
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <a07d8764-ee23-4d21-a7b5-121cb8a576b9@portwell.com.tw>
Content-Language: en-US
In-Reply-To: <a07d8764-ee23-4d21-a7b5-121cb8a576b9@portwell.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f3fb3f-0c60-441b-95a1-08ddc352f0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWxxNGg1blRFUmlpZ0dJTklOMWNnbDhDVzVGNGpVUnE3VnRiZm1rRlNSUncz?=
 =?utf-8?B?SVJ4ejJ5Zm02bWlVcDVGRE5tMjdqc2RVbzBIcWIzUFA2TVg4NnJwaDZpVnA0?=
 =?utf-8?B?WStWc2lUaEJ5SUVyTTh6UzBNSzJBNmQ2SGp2cVpodWdGcTAxejBhRzhGV3VW?=
 =?utf-8?B?cDE2UVk0dDdYNklqNEU5Y3JoRk8yYytrM0U1SmFFY0hXZy83NE1FRU5aUndh?=
 =?utf-8?B?UHpjaEhoZHRnZVo0aWJzRTNRSy80QXpGZEV5dVRiRS85cmkzek0yWitVZGhZ?=
 =?utf-8?B?eWhFYmt0c0dTSmovd29uZVZ5S1FzMU4zRDhPKytJZWNnVlNhY0JwdjdZK2g5?=
 =?utf-8?B?ZXNtSzlUZ2ZSYXhCUFJJeUYrcGs5Z0ZEdkh1UTF3bUoxTDVJa3dHbXJZT0VB?=
 =?utf-8?B?ai9QY0ZwVCtDeWdlQnB0VzZORHVvTVVkY3haeEhUcDRHN0JIakZHMG5EWmd5?=
 =?utf-8?B?dndZSXdxYmxOei9LN2p1Yis5Z0huVkN2d1poWEkzTXNiOHZIVnNPcGtUZ20r?=
 =?utf-8?B?RFFtcHRad0QzcEdpMy96Z3crTFQ3TUw0c05mRjV2bkRHMEdBeHNLcy9iN1Ft?=
 =?utf-8?B?ZnhteWpGM3JLMEZ0bHgxcmZsbENJRVQ1c1hNWUlDZUpkNjRYVU9YQzJMcUZC?=
 =?utf-8?B?bEw3VXVPc29mQUV2Mkp1Y2JvZEczSHNKTnM0NEtZamIyZFdlL21XcEc3NE1y?=
 =?utf-8?B?U1lmNzNFNXVrS0c4T3ZxY1dTSU5rSzRqa2VxS0tyZFdnS3VaZ1RnMnJUWDZs?=
 =?utf-8?B?eEdVeDBXV1ZWNVo1M0s0c2ZsSzAwRGY3eVpTV09ENnYwRDdrR1FqcWRvTDU4?=
 =?utf-8?B?eHNndlZ5QXphRmhueStGR2FNMUUrM0pldXZqUktXanV3Qkdac3NINURjellS?=
 =?utf-8?B?OGprQnFRVEdSOG80bWhoSGRSeHpxWFU5LzArOFFzU0dpcjFqOEo4TU1jZDZw?=
 =?utf-8?B?MUFNSXA0RUVHNm1OVmVSMW4rOXV5QmF5alppNEJQaWRJR1RSVWxqV09yTE1q?=
 =?utf-8?B?MEdOTmplRFcyZlc4THlPOEM0eWw5TE9qTll6TWQzb215STh4aEhoNnNtc1M1?=
 =?utf-8?B?RTM3S1RUYWZoQUdwdDRSNGpRUzdvVXJzNU5DZ2tWTDZ2c2NHUXh4YitxSU9T?=
 =?utf-8?B?OVJmQ2w3bkh5Nlh0MU5LbllaRjY2YmNDQkdMRElSL0tCcExzcUs1NXZETzFJ?=
 =?utf-8?B?NHA2aDYrWTU1bzM3czRsbEZCQnJpZ1JIQTYrYWI4OTNLalRIZWxwdWZTaVNp?=
 =?utf-8?B?ZndwdG9zeE1YVUZXVXdNSWxFTkN4RGwvMjRUc251R1pnNkVhVDdTVmlOSkZ1?=
 =?utf-8?B?SmdMWExLZW5wL1U2TGhtaWhJellycTNzbkFuejRQV0xJbHpiNEQ2YzV6L1pY?=
 =?utf-8?B?K0hsdWtORGRyeXczRHl6SFFWZDBnUU1vNG9IZ3pOM0VMUStzV0ZuQXhlOGJE?=
 =?utf-8?B?UzdqUHY4bnZXSHBFYUg2NW1UcVduODNLbVlNY05JY0hlUUJBS2xIdGw0TUh5?=
 =?utf-8?B?ZzQwSGZ4azUvZTRaODdnejZLL2FRZXhRZjMwNzZHMk5kU09TWFlyY1oyR3c1?=
 =?utf-8?B?V3VrMS9OWHhvSDlzUm9pNzBlUHZCVDRiM251b0pjNVp0NzNwUUZIZUtZZmgy?=
 =?utf-8?B?SEhLQWQvTE9yVjNaUllKN3hTa1M1b28wYXJmUjM0WTY0VHltV0lPNXBvcW1H?=
 =?utf-8?B?bXJFcDIybEwrRG5uRjRKV0VxTC95Z1FxK3BTWTBJYWkvQ2pUSHQzMDR5Z0Nm?=
 =?utf-8?B?UkdDc2xrRSttV3QxRkNFZUVqL1ZJL1VCZkNxQVhnajZ6Q0REakZUekhQME4v?=
 =?utf-8?B?YWFBNmQ1c2NlMXJ4TjBDdlFsaWhvMVRCR0Y2U2E1QkVZb0RKdTVGVEl3WGNL?=
 =?utf-8?B?T2RGRUwyQVo0SWx2anpOOWdzY2lISHhnV3dmaWZPUnduOHBkZXBUZVc0U2RJ?=
 =?utf-8?Q?IIBHe55KkVg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlV0WURhQVFwUzlqcFhQd3hvdU1pUEt3L2c0OVVpSHRLbFdPdzJZRjNOTkFr?=
 =?utf-8?B?ajJLeDFFbFFBbHV2RXZqeGJsa3NBaUo5MngzRmlVQnJMalpDOVFBTzdmVU5Z?=
 =?utf-8?B?TG5uWWkxbUp4Z1JEWW5GcytCWDJMWFVYSmRBbCs1NHhhbFRKbVgvaVdkSmNa?=
 =?utf-8?B?R25Hd2VsczJKTTlQSEpuZ1M4b25KYStyZjFIaWdHTEVUcmNnQkFRMkMvb1Nh?=
 =?utf-8?B?dW1NeXRPcFpFUzJQcXluUVY4MDM4aTVEZy95eHBZbFNnVk1leXByV2ZQVVVI?=
 =?utf-8?B?alBJbXNUMWtDZWhCdW9HNnlMKzFlTFJrRlYxOExFbXBYUUdGaFFvT1l0UUZx?=
 =?utf-8?B?cEt5TVVRTkpKRWsvbTVvM2o0R1FGclNUM2Fic3VjaS9zN1dFeUE2dXRyZm14?=
 =?utf-8?B?d2RHa203cTFBamF1MDZPWjhrQ0RDaHRGaXVjUzFaT2NWQ2xjSFRXOW1qa0Jv?=
 =?utf-8?B?MXdQQ29Ga0RPeWkxR3lNb055ajlrZk00RUdHbDl3dlR2ZFpKcGhnUkNCUGJm?=
 =?utf-8?B?ZW9xRmhZQXlJWEFtQkNxWlpaNGlBRThoMG1YWDg0TlNiWFdIbnJKSStDaEU1?=
 =?utf-8?B?WGZMWTZMUDhEdUxPa2pWOWRFRXFNRXEyUFVIYlVLejRSM2Vkc3pmOFVPaUZI?=
 =?utf-8?B?WkVydzJZaTVzaUJ5cFR3TjIyR09EWVZwNzJ5SUkvc0hPajNJOUQ1VjVOZHFz?=
 =?utf-8?B?NTRUOU16VlVodmVJY3lVU2F5OGVIQ1ZMUzc1QzZ6OWJoVmRoTGQ2QlR4a1FB?=
 =?utf-8?B?cVIrMDlzV0tSZTIrOVN5RmdKbWlTRjJRRXViTVBIOHFDMExkbHlvM1p0Wkdv?=
 =?utf-8?B?dk1UL2h0TWx6c0RGR0xtcm1YclhxLy9IMWp1TjZNcFpDSUR1c3Fyb3JaNWZZ?=
 =?utf-8?B?Rjh5QXhPenhNV203VUozaHFUc2JWOGZsdG1PY0JuTXZ2NlhLUnBXT2p0VFJm?=
 =?utf-8?B?NTh6c1FUTVJsNG0xeENOcVNKYUZPQW95UUdmM1ZyQlBEQUpyU2VPTHN1MVpN?=
 =?utf-8?B?M3VOMGpVQWJMdGRzdk1tNHdZNStweTB1NHdLYkVyVi9PRDZyeVBGU21xdmFS?=
 =?utf-8?B?dm8yaStGQVN0WFhMdzFRd0RKYTdldzJMTTVqK0dUcG5MMGJsZ2VTVWtlYjZ6?=
 =?utf-8?B?dEpZTlBTUG4zaHJ5STQ3QU1ZOW9nYnpIL09PQ1pWbFJJbzlvbXIxR1hidmNY?=
 =?utf-8?B?bmI3YW9vTUgvRHhNcjVpQ1NMbEZ2MnRJejMyd0ZlUzZEWVNnQ2d4bHhPZnJP?=
 =?utf-8?B?bUtGM2xKZ1lxbDRMMmozSGdUL3FpdWttd1o3T2tsS3orK29JOFZYa2ZBalJR?=
 =?utf-8?B?VW9SUTNUWncwbENGcU5rdER3T01ReWV0RVF1OVJRQ245K2dsb1V4TkdZVERH?=
 =?utf-8?B?ajRtMjhIbE9mZHJEQS9URkxZSms1RFhVRWlCMy96c0ZUdmZRdk1YcEFOV3Mz?=
 =?utf-8?B?UHpxM3R4eTQ1ZEoxKzJEdDFoNmVBOWNnZWsrc0hIeW1ucUNDSGE2WDkzNXFq?=
 =?utf-8?B?RjJjWjFhYURRMEFpdktXMGJWVjJKWjVtclAvbEhsdEV3cEZPaHE3SStJSURa?=
 =?utf-8?B?WEkwWE9EVXZEQlRBL05WNGsxcFdwWUxxTUgyTHhSSkYrVEhlZDdRQThZaDBK?=
 =?utf-8?B?b0VzaXIvL0VsZk05ZytJUE1Id1FJRmFheWt0ZFNMNzhWa2JrWHRkVUhPQWhX?=
 =?utf-8?B?QWZJY0NHWEhWa0p4SmJ6L0ZFUFVLRTJDQ1hBUktZSzZGUE1udk5VdUJLVWh5?=
 =?utf-8?B?MFV0bVpDSlJTcS8wSS9RbGwrNk0wcnVlVng5cmJzQXpVSzhkdDFwU1dKMXlu?=
 =?utf-8?B?d1pjSW5rMXB0dmpCdExOOUdpU29ka0tmdWV3aHFxc0JnejdjUFQ1Q0Rvd3ZZ?=
 =?utf-8?B?R2NIcXJiUlZLT09HY05qVlNIQ0FlQ2VxY3JBQzh4WTNnclA2ZkF3a29mbEli?=
 =?utf-8?B?YkQwSlN6dE80cHlycTU1dmxNUDlwaTdXOUpIWlY2SlFTZ3REK0F2SXlQSWJi?=
 =?utf-8?B?NUk5T1llMFY3VVBJeHREVkNvbGl6VVhmdGNUTUg1Ym5FOHRTVVJ2R3dSUkda?=
 =?utf-8?B?VXhNWFM1SlpaTTZVQmVGQWZ2eURzLzMxSmlIUzl1cDd6WDk2dEZPOEc1eXdC?=
 =?utf-8?B?V3BZTXladFI4Wi9CcGRnMm00THVVZ2NrRjBQTVQrU2NXeVhtVmRqUnNvdEF1?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f3fb3f-0c60-441b-95a1-08ddc352f0a8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 03:51:55.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TcBsVhWKqKfyyRZC3JD+tVstwI72fma8JROwXNmFMaDVtX+kCNSXJzUcjGbCfc9ICUNpksFBohCLvBDDADHk74wVxc4pUhlb6RVU3rvJGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6748

Portwell EC does not disable the watchdog during suspend. To avoid unwanted
resets, this patch adds suspend and resume callbacks (pwec_suspend() and
pwec_resume()) to the driver.

The watchdog is stopped in pwec_suspend() and restarted in pwec_resume() if
it was active before suspend.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---

[Re-sending to fix message threading, no content changes since v2.]
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

