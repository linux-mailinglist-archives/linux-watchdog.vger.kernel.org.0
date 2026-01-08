Return-Path: <linux-watchdog+bounces-4770-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACAD01CA3
	for <lists+linux-watchdog@lfdr.de>; Thu, 08 Jan 2026 10:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29B1832F857E
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Jan 2026 08:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992EA35971F;
	Thu,  8 Jan 2026 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="YPa+fs7x"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012059.outbound.protection.outlook.com [40.93.195.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1633F33D4EE;
	Thu,  8 Jan 2026 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859162; cv=fail; b=n4wV2MEPmQkGg5ZG59sCSXDD3nrB67uxc0c9/Cy6oAZDlpETZbarE+qjzIvVUXcDq2Tc6J0A3ncrlHU2Nti1oyYE2P6teS0U3lfEnj97pUOIMI3Q3vhylvIKxyDJ0T4U+jxWFLuoOe20C9Z4D0Bygwt+oiUfb5BaxFPGnCEbhoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859162; c=relaxed/simple;
	bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+VUE5SVVDvAxFhxQ0CSeEfvuJ9yWyQ8rRo5HbP4SZ9D1hZFgHc4d0/P+cF688R8eTKls0OuDMFsbLM4YyGo2JA3eI4+fica8CvQyKfMX1T+yrTOv36S165tcaVQCht7TuX6a/X0J+92a5zxk0eJJUNhT9gDkuXeT4VU1eOnhmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=YPa+fs7x; arc=fail smtp.client-ip=40.93.195.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfItQrya7HU9Fxx/49nwLUU1Tflt98b79FzpbsWmKack5VlzVhYcnk/i6+9JFscR5vDoQ73B67VkN6kIlWIefhmyssR68P9EDGFfWoX+UFVWmtQMNUay6E5GRj/62ms8J4KJQCf6l9LvaIah0lEL3hAaJOdkUANdPpFF5/lM7FfM0qzYnXWFDVkPmZsuKdmDxcJWCMNejrkFSjYdrwEFcpqOt0opmp2Q4GFsJj2wigubHf8Yt764DOHG/cfs9bz+NJ+GLVKBThJNSWywq0T8QbYp3ZBQ1Ooy01OYdW85FIwrw8WH4AQ6IWm89jKod5QGJGi0V/JSOBMC+1F8tfYobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
 b=fqsSw8SiLzr9Zg3X+SBfgOvo9b05czLg5GpSNVWeA5h0ZUV4WoZZyQQSGtbGjgq9TGEiaP9K9vGPtOOQRQVWr85bPBN9i+eSySQVWT5UsCnjXMWQHqBnhEgX1M5AOgrdmDK/XB1CdlBic81ntsl+McjMuvdFbEQr+cCStEGF7CqN5JcwzQUiTukyFK3YiIUk1PWLkiVeKGIjcUrxA3/TZLf/qZrZUWROm4rYnwz18AXuZv7bZm9r4sgl0VMB3nVjCxQj4jxT4lZ1FriB0NloSZ/jOtPk73/aLb1Chrs9kIAN/UZI7gJytt+I+mbGwBf20XIZIG0zcnynS2iK6SQ15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnydipJ7ouDrwBkxE4iPSeuhP1ih673IRhgHIT8+qXM=;
 b=YPa+fs7xA704B2t+bInj3xVr1PzkM0jlSXZfuYgEH5c7hVhA2zfAdDqGQ5ckSkf4o1Hy7lbw2SuQzJbAhDHqVyPRR4aMtuPyNczOn546IP0hsLaOg4Dis29EUQAFuM/Sl64nogaJ6G38gfW3a8auchcXIb44y6SPWy5xyvr33p8BzcGA3kT6wFUPi2OqrJI5tIwJBC8jLffbudNfo6JvcGC/G5lDbwuKH88689TVg4BTUOog8TqoQRj5ygw6/yfm3QyzIQg252zbP/WtBeS0qD6h9ISrv3FiuejYM71SFq9d4+TlR4l3nanPODMLoRB3b9OUNv4SBKavX3u2rg+vyQ==
Received: from CH2PR15CA0011.namprd15.prod.outlook.com (2603:10b6:610:51::21)
 by SJ0PR22MB3480.namprd22.prod.outlook.com (2603:10b6:a03:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 07:58:40 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::b) by CH2PR15CA0011.outlook.office365.com
 (2603:10b6:610:51::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Thu, 8
 Jan 2026 07:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 07:58:39 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D10DF1A2CC;
	Thu,  8 Jan 2026 09:58:36 +0200 (EET)
Message-ID: <493b1bac-2eae-4c78-9c07-801eaf954b04@gehealthcare.com>
Date: Thu, 8 Jan 2026 09:58:19 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
 <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
 <04d8766f-0f79-409b-9290-3170e99e9750@kernel.org>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <04d8766f-0f79-409b-9290-3170e99e9750@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SJ0PR22MB3480:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ad5ca2-437c-43b0-9a2c-08de4e8bbc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmxzdDNvVW1zNFVUZHdPZnJ2UmNFODRKUDRhWi9paHpHS0IwUloyR2J6aGdq?=
 =?utf-8?B?MmpYZ0RxUXdkbGZOWjlNZUluRThYVFgyMENidEFKeldqRU54YUxBV2toUlpx?=
 =?utf-8?B?WWM4L28ycnpJZ1dsanBBMWFBazE2REhTeStmcnM2cktZYTRqZ0lwZ0ZhZnVa?=
 =?utf-8?B?djBJTjJBWEtnaC8xVzJSZHBlbGczaCtCR3h1bWt0UCtITlRrVS9YUG9FbkZO?=
 =?utf-8?B?a0kxU0lqRENUUmlrWUFYcXlHYWxLRHRYRHEvbFN4OHpHem81QnRWQkdDMTBt?=
 =?utf-8?B?OHd4OXJ6WDJQay9YczZEeDl0RllIS1p5bGNFOU5aSjhORmJHYWRiWExrYlBP?=
 =?utf-8?B?UW5qc1ZZeE1XMHRlU0lDanV0M0d6S0FyWlhaamFPSkNsMHJjR2VScGppMW9x?=
 =?utf-8?B?L0VWMFgzUnU0UnB4eW9IcEIrd1RCSkduWGt5Rjk2cDNlVW11MWpEeWVpdWhi?=
 =?utf-8?B?QWdIWnhuYjVFQ0hFNThLZ3VqekN6dDNiUENqeTNLY0FHNTlsU0ozdlovQ1FK?=
 =?utf-8?B?QVRoV1AvUXgzSmtyQkswYUNGbzNGdFhPWW12UjNUb0J1Q3ZyNjBKL2lyVjNQ?=
 =?utf-8?B?WmxkTHhpZTdnQ0JuNndsZ1Q4SHlnalhuMXV4cCtJUnpqTENCUjZROElUSEhw?=
 =?utf-8?B?dWJaTmxJcUJxSEFlazdTU2w0NG9rZmw1b2MycHlkUWRBQ0dyOUdxSGdqWkFm?=
 =?utf-8?B?cng0Nm5GbUlGeGdPa3p6MXBvWVlqYm0yM1g3YWRtYjZ5M1BUZjV4MGpkOTR0?=
 =?utf-8?B?M3dUck9pc3ZhTUxLSmFqWUpFdHFMZ1RSUjd2NkQ5OHIreHZ1dXhtOEV0RTJS?=
 =?utf-8?B?bnF2QjM2TWx4MTBWdEZqb21qNU93WDNJSTdieDFYbFl1RzZMSDZDUWcxUUEx?=
 =?utf-8?B?MzhCeVhjYmNFVHJ2bXJvdjFXQUF1bG9KMUdqV3FucVM3WG83S2RuQzRUNWVE?=
 =?utf-8?B?Ujd1NmU1ZFNHcURoK3Q4UUtsTUUvVlRqS0VDNmF5UGV6OFYzYi9kdUdpa0tG?=
 =?utf-8?B?ZDU1V3FuVzF3dXRZTTdnSmxnZGxtNHRLbFd4ZTQzS0tHOTREeEk3RWFmcGlw?=
 =?utf-8?B?d2pXeTFqeHg4ZUk1c25NNmhJdU5GeTVHQWd5ejFBbERORHdjZ1ladTFobHd4?=
 =?utf-8?B?L0pvVzFKQm9jK3czeVRVWEg4QWpwL2JqWUVvVFZnMVZNRmkyVzZhMVdPdE1k?=
 =?utf-8?B?VTFQeEFsSUYyZ0F6dG0zRlBwUHZ6WHZPSG8wT1ZpdkRYZG1CQzZ6bjlSVTRh?=
 =?utf-8?B?UzA4Z284UGovS0M1ZlJKL1JLbUtuU0s0NUJWODBXc0h4NGV2Tlp2c01za1dE?=
 =?utf-8?B?eDFjQXdNQjJwbm9GY01Ra0tJdVJnU1d5NVpRWllaVEpUYkFvMkRlZnJJMm8r?=
 =?utf-8?B?c1RuaG1KNmE4cmxvM2I1UENLVE80OVZRWlVNellSOWNjRzZReHZkYXY0eXFN?=
 =?utf-8?B?d25MK1hZbjd3cGg1ZExNK3BCaExjRTZTbEIyejRQeEZqUk5CYjVYMTBjUFN6?=
 =?utf-8?B?cUwzTlZ1TER4MEhSWnVxRjV5Z2pxYlg4VFd0S0NpVitldkVJMDBrTTFHNDJi?=
 =?utf-8?B?RDVidFFpWklwMEJLN3V1Y1Fvc2lWRUdIanVha3A3TURZV1hLVnhVeEsyU0NS?=
 =?utf-8?B?dnBubit1Q3R5ZmtkRCtGQmNPdGJEUm16TzVtdHNZVDEyelBhOExQeFZJcERK?=
 =?utf-8?B?cXNYTHpuVFBPRmZLQW9qNElCNTlsS21wMUJQYU53Y2tpSUhNM0RmVlBqek5H?=
 =?utf-8?B?ZVZhK1VFYVJDaS9LWFhCTzdrMFZoVUI1T21wRkRTaGV3VGxlcE94TVpvNHZv?=
 =?utf-8?B?c1lnK2w5UUtoc1ErRXA3bnV3Snhod1hmdVV1WFdRdXRMeVJRaCtTK2U5ejdS?=
 =?utf-8?B?V2xtOG00RXdUN2dwUWJRdy85ckQwQVRnMmtvdk96ZHhKczBGV3hoYzljZmZa?=
 =?utf-8?B?TGxBK2ZqWDVneVk5RVorYnhDY3N5ZHo1N3U0YjlmZy9CbDl4OUJuTW1SYXp1?=
 =?utf-8?B?MFV4eXdQSktpd2lnd3lmMW1PUDZWNG9aT0RER3Q0R3NBUXFsenhrQWo2OHJx?=
 =?utf-8?B?RzRQQk40dS9meEk2bkZ2bzBDUDdWUHR4akhJeHA2OFczamZNeHdNWkJ3N1Fy?=
 =?utf-8?Q?Fvac=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 07:58:39.9541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ad5ca2-437c-43b0-9a2c-08de4e8bbc77
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB3480


On 1/7/26 12:48, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On 07/01/2026 10:12, Nandor Han wrote:
>> On 12/30/25 14:34, Krzysztof Kozlowski wrote:
>>> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>>>
>>> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>>>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>>>> running in low power modes (STOP and DOZE). By default, the watchdog is
>>>> suspended in these modes. This property provides the option to keep the
>>>> watchdog active during low power states when needed.
>>> And why exactly would that be a DT property? If system is sleeping
>>> (assuming this is what you meant by low power), no one will pet the dog,
>>> thus watchdog makes no sense.
>> Thanks for the feedback Krzysztof and Guenter.
>>
>> In our case, low-power mode is disabled. However, we have identified that under certain conditions,
> If your system has low power mode disabled, then you do not need this
> property - you already know that watchdog must continue (or whatever you
> want to achieve here).
>
>> specifically during simulated high-load scenarios, the device becomes unresponsive because it enters
>> one of these power states.
> Device as watchdog? I really do not understand your explanations, but
> for sure system load is not relevant to DT property.
>
>>> Otherwise I fail to see how this is a hardware property and we do not
>>> accept SW properties (see writing bindings, numerous presentations).
>> Our system is based on the i.MX7D CPU and the watchdog peripheral supports the configuration:
>>
>> (From i.MX 7Dual Applications Processor Reference Manual, Rev. 1, 01/2018, page: 1174)
>> ---
>> WDZST
>> Watchdog Low Power. Determines the operation of the WDOG during low-power modes. This bit is write
>> once-only.
>> ---
>> Given that our system does not support low-power modes, we intend to enable the watchdog across all power
>> states to ensure the device can recover properly under these conditions.
> That's not what your property said. Your property said watchdog should
> continue in low power modes. So when system enters low power mode, how
> the watchdog petting would work?
>
> Now you claim you want to enable it in low power mode but you do not
> have low power mode? Does not make sense to me at all.
>
> Best regards,
> Krzysztof
>
Sorry if anything is unclear. I would try to explain the change from the driver's point of view.

According to i.MX7D Reference Manual, the watchdog controller allows, via the WDOGx_WCR register, control over whether the watchdog continues or suspends in:

a)WAIT power state (bit 7: WDW)
b)STOP and DOSE power state(bit 0: WDZST).

The current driver implementation provides a Device Tree binding `fsl,suspend-in-wait` for configuring case (a) and forces the watchdog to be suspended in case (b).

My patch adds the ability to configure case (b) as well.

Regards,
Nandor




