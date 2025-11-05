Return-Path: <linux-watchdog+bounces-4518-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48CC36FFF
	for <lists+linux-watchdog@lfdr.de>; Wed, 05 Nov 2025 18:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9BEAB4F7703
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Nov 2025 17:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD54633EB10;
	Wed,  5 Nov 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ur3eRoIl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC133E348;
	Wed,  5 Nov 2025 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362202; cv=fail; b=mIU9EjaPaM5EAqE/JIK8FdsMR++WB5ymuThfkW4Zq1e6BgOpk6xwF3YvTcp1dDwWXq1BQN8SlOr6W1Dg0KSjfgHEDqPk8RZ0quh3ZZhBjn4/7cffUc8329N6qfgirbH5o8qfEsdrYYJ+2I1B8WRwDMOABWL15AwOKMk6v22iqj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362202; c=relaxed/simple;
	bh=yFQEKdYAaQ92s8V+vt1YRTDxEhKGi9a/rgbm11gWwHk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UxHqRPOvdgcUzYbd8XPn+by3x8ejnHnQ3G4X46xfKrhnLxgUPM0MfaW1wVoUvX+52bHv53lEUN1DWKGTmdPaCqyzYuoXRdcB8eetAmcft0idScYv8g8BoC+N2qvqWVv56U8dhlDvYrnuArB5YlI/NzDVR8fEICZPFa+m8srTqFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ur3eRoIl; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2qDQrRhS9t7+1bmisbLB+pIc4BKEYQht1zNJSzsa8pVN2+yh1OiJ8d2OzYqHTIymqbMJ+qeqDTJj07fD6jCE/jEUMkQeh5DQ3OxN7u9RlUMQ8Xdi8cBLI3Dy2HRV/9RuU0C9+Nq2EK/Zsdv9rrrWEEt66EZya4QbYGc4R2JGzgs4XTChPZnBukdcRBQwF6VsBS3qrSp609avHxw6XYhIcHZCO9ccz5FDR8HYb2ticpAlo1In+LtWsE9zhQYQ3czhtzMTvFgm1lZejSr6+lH4xgspROBwuqDTA5yzr2USRxTSl/s8zseanGU0k2CjQ3a24lBqgYOwPKPdg9ZviDvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn3eIWTfQqSw2yqM9BjDDyVyUm+7ho21oa1ANE5IkQc=;
 b=VvghMwCWuLwIY3w85+q5LBAMVqPW5seOYhJhZe+OrqC5P+aYeOLS8tg8/vGH45JFJ+OrCjwUWpfzPS6bsRBeFtxEI3z78Q3/4HI3QPXk1yQH+SW4r9rGIYkLu17QFN+54bqfXqImLIkmHBPRlaNZEr4Y6Ks6P2OvytHK4rsA1IEknAIT7xLivvxrQarB8noUkJRURbrs7X3Ewx41gZkeKexNfvmlrrAF5/M718T67ekzD/0Y+IevwW+r5Z1uZUhguImjd4Hc9+yIqB+yW+JGrSkzMWeVaqSayHP8JxOvcXKhd75OqXq4ieZ6tqEMGKbwFnNiqg55jjMV5Wi5heQZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn3eIWTfQqSw2yqM9BjDDyVyUm+7ho21oa1ANE5IkQc=;
 b=ur3eRoIlZh6BFa0h64l/mVY+dpZsWB/XVQ3tbMMWM1uhbl+qGeoBntclAbaJYmS6md2e1uiAuwiwzE7v03GGaUA6PRwtl9le8SC/szeekhQgW3P4DSwpOVSF1xArV/5f0ITTYg4z9EfzvjdFBjk9IKgHtxVqsyTZG5NhmOscnkgIfR5Xmx3vFV/J4/paxBsi2l/3tJSlrocIv0QVtBkxcf/gOCwbMKGuOJNyJ7nxUZ6cGDv8OxtQYfBcnjpV8f9pSmLyb00egc/ae9YXhEmsE5eShjM3zDt2+M9VFnvTHJlj2+71mBPVcn/YPnnYBho+bvRp9WO6blG8AXzEWPRqUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5305.namprd12.prod.outlook.com (2603:10b6:408:102::5)
 by PH0PR12MB8824.namprd12.prod.outlook.com (2603:10b6:510:26f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Wed, 5 Nov
 2025 17:03:17 +0000
Received: from BN9PR12MB5305.namprd12.prod.outlook.com
 ([fe80::e7a3:9531:f0c9:bd7f]) by BN9PR12MB5305.namprd12.prod.outlook.com
 ([fe80::e7a3:9531:f0c9:bd7f%7]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 17:03:17 +0000
Message-ID: <4626af52-9d61-46fa-8e09-5389181d65ae@nvidia.com>
Date: Wed, 5 Nov 2025 09:02:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] watchdog: sbsa: Update the W_IIDR Implementer bit
 mask to 0xFFF
To: Andre Przywara <andre.przywara@arm.com>,
 Naina Mehta <naina.mehta@oss.qualcomm.com>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104063937.839138-1-naina.mehta@oss.qualcomm.com>
 <0e6b0f23-0f4c-44eb-892d-e6785c5767ac@arm.com>
Content-Language: en-US
From: Aaron Plattner <aplattner@nvidia.com>
In-Reply-To: <0e6b0f23-0f4c-44eb-892d-e6785c5767ac@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To BN9PR12MB5305.namprd12.prod.outlook.com
 (2603:10b6:408:102::5)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5305:EE_|PH0PR12MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6365a9-a944-411f-206a-08de1c8d36e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW9LNS9lMDRJdVZGYmxlTFlLY1pVU2duWGI1T1ZjSTRydi9HemdxN1k1bElX?=
 =?utf-8?B?RG9ZcTNuK1ZORUNKYzQ1RVBRbGZEY0ZudDE0a1RNaGI3TEhJTnd0cjZEblo5?=
 =?utf-8?B?dmZNei9mMThrYzZxdDdoRVNTVVNVbjZNODh6Q2NzbEVYY1BTV3ZVRFFOUUl4?=
 =?utf-8?B?ejEyaW9MKzZRNFNBaDA2aklTUUVOMDZ2L1EzbmJmdnJGb3VRVndyMDlEWDJN?=
 =?utf-8?B?L1kyNjBoeTBUZGhPbGdkdGgxSUpwRWdyZ3NURkRKSXMzSmtYOGZEaGpmMTU5?=
 =?utf-8?B?NTdCRXBya21BK1VYZDI1V2xUMFV5d1oxcjlydXhxY0NqbzdZRWdraWQwNWti?=
 =?utf-8?B?MUNjSTRZZUJGMWVkM2MzY1AzbW9pUVBneVFlY20xMGJySUhOK1hCZzFRbjBq?=
 =?utf-8?B?UWI2MFRFWFhTRjhLZ21KYm9FdjlXZXk0ejJzZzBjZm9JMG10SG1yTGVMeW9t?=
 =?utf-8?B?SzRTbk9XRDlDdnk3VnFteTlaaFJURDlUMEdOMGgxTG5tMWdJZEhjbFlDT3h2?=
 =?utf-8?B?bHJIanFzMEphRTllYnFmSGhYVmRQYXU4VS9NTDhEZ2pLUkdONngxK1doQVZ0?=
 =?utf-8?B?dmNkMG0xN1BuUmtISlQ1Z3hwQTdUYTZlNWxjQ0F6QzlPWm9GS2ZVdUhqb3Vk?=
 =?utf-8?B?UFRSbXN4L0MyUGZaTTdFbXZPcWI3Y0lrenFybHdER1AzQUkyN0paUHJiR2dj?=
 =?utf-8?B?b1lRSEtpaXJMVFlKbStpa1VkMHhaSUFKZGtvTllKS3J4ODd3Znc0MEpVTlMw?=
 =?utf-8?B?TkdVVkpoVHZucmEwNGo1THFkTGdTSjVQTXNrcHQ0Y3JiQUhlelU4R0lyVVZo?=
 =?utf-8?B?clpwbjZ0MCtuV3dqR3Vza1JUMTFCdUVHc0VHaFRVSy9lN1VhblJ6QVMvZ1VK?=
 =?utf-8?B?Z1pkVHhvOWZyQUJuSTBaeEVDUGhGbSt3RzFnUzZDY3RoTFlWbkliLzI3Mk9Y?=
 =?utf-8?B?TUdYcWlDT2NTUW5JM1JSYlFkcHNSS1UveVl2Y0J5UkFUa2E1Mlo0SFRmelpC?=
 =?utf-8?B?N2ZEWWk4ZXVjM1hjSzEyT0NqczQyMzRnSmVUeUk2cmQrSjdRVzRSNHhXMENC?=
 =?utf-8?B?V3RtV1RtcWRDRis3UUk5cHdlY2hzZCt3VXA1MzZwdHNuZ1NsNG5PaTJqRU5U?=
 =?utf-8?B?cGJwK1lJZ1VFZkp5b2ljc1dWUnp0NG1hNjc1OFI2cHEvV0lKVDVXa0RRMy9T?=
 =?utf-8?B?cEFxQk16Y2xXYjMzTjRJQzNhY3FiMWhsSHdTVUI0WHJyc1ZOVWp5ZGVXbjBh?=
 =?utf-8?B?dnFUcW9QM2hBWVlyVVVDL0RYVDJhYnhNUDJWSDFPRUR0WkJtajkyRzZuNDVD?=
 =?utf-8?B?emRlZHZPdFh4Z1Q1ckowSVJyOHI5ZklpSnpza05WbjJDV2c5bUE4cG5EOFpi?=
 =?utf-8?B?bnJQM1hnUFV6RnB0cDBKeHFUQWU2bE1uUkg4K1NRdDc3THBxSlkxd2N4Mytj?=
 =?utf-8?B?bTFFeEtZa25QV1E4REIzR3hkelJXS1RzcllUZ25Xd1htZzZwTkU0ekZGbTZE?=
 =?utf-8?B?MTZYOEhzU0E2YkFwdGxhQnRCcFVHSFFwT0FIbXNsT3ZDc00yWVFVTnNIcmtT?=
 =?utf-8?B?VUluWkY4YmZXakhzVWhFTU91dFlMZWJ3ZEFsUHhQdkVKQWRjN1Q0UkdQSUxa?=
 =?utf-8?B?MjBuTUxWSkNwMTdWMnVSSHkyNUxGcmx6OXcrNWpFdnFsSmttYVdhVGNRb28r?=
 =?utf-8?B?OTAzOUdEcU9YMlh1R2hiRExUb2hEbThlbFFjSjJZbHhURmtTekd1aWx1aXJj?=
 =?utf-8?B?TW9KclRxOEVYT1JuNktzWFZaampxaTVTVDhnY2FzVUVtVEpRamR5VGp0aSt3?=
 =?utf-8?B?SDRLWlNJUE9vSnRYbnJPVkpUTmxWR25mVzRtS0g4T1lndEY5NVovMVhqVHA3?=
 =?utf-8?B?ejZMakZvWTZVOGRNUmpjVzJHd08rREZObCtMUGFyTSsrTlAxTlZack9scmt4?=
 =?utf-8?Q?F5f3jRREBytE0hoxt0yb1jwZ887hnCC8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5305.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elJSMm1QV2hrdU5MRjdvVk1HajZZVTBPSXY0Vzd5NmVNZ0tIYjA5dXNBZ0pq?=
 =?utf-8?B?aXlIZlJ5OG05czM2YS8wSUFoV2RHQldmQ0ViOWcvWVNSQTV5a0ordnZJVStK?=
 =?utf-8?B?RlI0anpmN0hNTUFvaDJ6T1pibHZodmdPTjQwcENhNkg1VG5UWm81cWJXdTNB?=
 =?utf-8?B?ZVhqMGxKblhudHlWY2MzcjlHOFRjWWNXSC9seTh2TVE0VUthbmdtUytjbDg1?=
 =?utf-8?B?aUpSS3RWR0ZhMUNld3lodzhvWWtzMThtRndyRFd3V0I5cGJFMkNPYTVjUkpj?=
 =?utf-8?B?WlVheXdFenkrSHZOaUdEdGJjN0ZMcGhxYnZoQTNKR0VEMVRkd2xRMjdYSnFr?=
 =?utf-8?B?bkRFRlpJcnd1SzBnR2F6aWY2YS9ra1VLMkVKSTd1ZWtwNGJ2bldHWUcwRk1h?=
 =?utf-8?B?eEhMd0k1cTl5YXdyYmdIMXZyU1ZXU2lBKy9tR054b3dsUnVQUnEyS0NFbDdR?=
 =?utf-8?B?c25sMzFpb00rMldRcGphWm1FV0gvYmRiMDR5VE9DaGQyODByek13SXZUTWlz?=
 =?utf-8?B?bExpZXhZcnI2UjkwS2FsZnhTblZ2MnBINm9rWlNjenkvSFpJWXBDOVhlVEE0?=
 =?utf-8?B?aVA4ci80cWZFMmphOERZRXZRNW9yMzFrSGhXL09zT05yTXVMUVFDR0tjeElQ?=
 =?utf-8?B?Mks5NExUSEFvU1ZQa2dCeDdrdEtzdVEvbml1eG1FRnpTU0dlUEhGb1IrQmdN?=
 =?utf-8?B?WmN3bkdRT1RleHVqUDREWW9IMzUzUDhlSXZRMHlpK2lqUlJQOWtMTCtZRWtZ?=
 =?utf-8?B?blVCK3RWOXpDbkhadWxudlBxY05JUnRubTkzWnR2TlB6bzFKbnhhd0hUNjNH?=
 =?utf-8?B?QTdwRlc0TnUvVjJKbVROWGVJV3Z0blByVXROU3FnYnA0MHNPekdWR3UydTA2?=
 =?utf-8?B?Z0hHVjk4M0dlZFlMZ3YyUS8vNGN3bVBGZW9LQ3hhbWQ4eWtmYmpTc2NpT29q?=
 =?utf-8?B?Y2JlM0FjWEp4TEVIZ1hLcUVTSXMrZGtuS0RsT0dsYTRwRXVkMDJveW84a3BL?=
 =?utf-8?B?MkIrTm1wcmYycXVaSk9MOEwwbi9hQ3Z0dWlycmQzNFhVTDRaRkhNZDM0Y29L?=
 =?utf-8?B?cGZFdHJFOFZzQThvRXQ4dS9aVjYvdVdaSlNHTjI3bEdHYXhRaTBFeTFlaHh5?=
 =?utf-8?B?YmxrQkJQVmlmeXI1czY3VVF0VDNaZUhnUEN4OEtGcFl0V0JoNTIxMnpRaG0y?=
 =?utf-8?B?eUJERmJrNllnWE5rcUtRdGFFRlR4M1o2NFUrdHpLczRNWkxBbWhRMmNaL21w?=
 =?utf-8?B?OXQwYjYzTkY3NWQ2VHZYSnZ2UGpIbHdPcFY2L05LVEVvdDR3YnhEbzZxWWVl?=
 =?utf-8?B?UWVFd2JwbFp5Mlk5aW5KV1B3VDRWZWw4TG4vVnBjZVNDU2IxdzFlQUFVUXA0?=
 =?utf-8?B?dW5HVFJwcUNxTVJFOGp1YTQ1N2FKYk9CK0FJRno5QU00bDhDU0lXTEhrR2sw?=
 =?utf-8?B?R2Y2ZmJTYXRmSFFvTWFhbGVQNHRVeUNYSk5LK1hsVDNmcU84SDhBbjhqMHJM?=
 =?utf-8?B?aGhQTzFldVc1UXFrQWh3VnlxUUNZR2ltOUpOSTBXQXN6c2xFMlRZcmx4VHA2?=
 =?utf-8?B?bXZ3dkpCYUc2aFJZdzdGLzJYY0VYSEQxczlKUlh4Q2Via1pxRkxpYTU3SXUz?=
 =?utf-8?B?b2thZXlBaTFXdHNHNjVadjU2M2hqME8ycWxmVEhUR2Z5bFNsc0pZWnE5N0Z4?=
 =?utf-8?B?WWFDbGlpdERuZWhnN2I1MXkxS3I4Sm9vZk93cEVLdzVadVE5MElDUmxHOUVj?=
 =?utf-8?B?aUxGZExVNkhheER3S1N1QWNRS3JnOFYvVlMwKzJVWW82Yk5wRGdMdTZTdUNT?=
 =?utf-8?B?cXI1Y1VMVFFBWjd4UVFVZyt1ZEZiUTVGMjNSSzVEbkxURjNDa0VmUnZaNGsx?=
 =?utf-8?B?dWVsUTQ0bk82elptU3FySEVGaG95aVZ6VDFZRmtUc1RMRmlJV3Y1dVhBNW5j?=
 =?utf-8?B?Rm9MWlIvcDFBQ1p6Nm94V2VmOHVKWHBHN09wbHRFVGlZOC9ZRkQ4aHFFamhJ?=
 =?utf-8?B?RWNlNXR2S09MSWtlZFB2d0tLZXlUMVlGNkQyMUVsZlowVmQyb3dDU1VtQm5K?=
 =?utf-8?B?aDJJNEo0Q25LWE81VTdlUWhIOFJkRHZqUzRtV3BXVG1Rdm9tK0NoeDZiaVRZ?=
 =?utf-8?B?b2FwT2ROVVNSakM1Q0htUHN2M1ZiOFBabVFDWXdUaEkxUGdsNmM1M29oWk5u?=
 =?utf-8?Q?Ov+Mc/+uEi705Qtyey7dG0g=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6365a9-a944-411f-206a-08de1c8d36e2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5305.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 17:03:17.1906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0alQyjSd9XqpcQeD5EPvNt5YnRpNmnXMeJJHGmd2NY2WgYCELhPjbsZDzmWOD9oy0mCHhKUxBBdV7Af+9Aid/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8824

On 11/4/25 4:00 AM, Andre Przywara wrote:
> Hi,
> 
> On 04/11/2025 06:39, Naina Mehta wrote:
>> We noticed that the implementer mask defined in the driver [1] captures
>> bits 0-10, whereas section C.4.2 of BSA specification [2] indicates that
>> bits 0-11 of the W_IIDR register represent the implementer JEP106 code.
>>
>> We were hoping to understand if there is a specific reason for using
>> 11-bits in the driver implementation.
>>
>> Looking forward to your insights.
> 
> Well, looks like a simple off-by-one bug, doesn't it? And nobody noticed 
> because it only affects vendors in the later JEP banks, and the only 
> user so far is comparing with 0x426, so it's not affected.

Yes, I think you're right. Sorry about that.

As far as I know, there isn't a 0xc26 assigned so I doubt anyone will 
run into this. And if they do, the workaround it applies has very low 
impact.

>>
>> [1] #define SBSA_GWDT_IMPL_MASK    0x7FF
>>
>> [2] Implementer, bits [11:0]
>>      Contains the JEP106 code of the company that implemented the Generic
>>      Watchdog:
>>      Bits[11:8] The JEP106 continuation code of the implementer.
>>      Bit[7] Always 0
>>      Bits [6:0] The JEP106 identity code of the implementer.
>>
>> Signed-off-by: Naina Mehta <naina.mehta@oss.qualcomm.com>
>> ---
>>   drivers/watchdog/sbsa_gwdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
>> index 6ce1bfb39064..80cb166582df 100644
>> --- a/drivers/watchdog/sbsa_gwdt.c
>> +++ b/drivers/watchdog/sbsa_gwdt.c
>> @@ -75,7 +75,7 @@
>>   #define SBSA_GWDT_VERSION_MASK  0xF
>>   #define SBSA_GWDT_VERSION_SHIFT 16
>> -#define SBSA_GWDT_IMPL_MASK    0x7FF
>> +#define SBSA_GWDT_IMPL_MASK    0xFFF
> 
> Can we please use GENMASK here? This probably would have avoided the 
> problem in the first place.

I'll leave that up to the maintainers, but assuming they're okay with 
this quick fix,

Acked-by: Aaron Plattner <aplattner@nvidia.com>

-- Aaron
> Cheers,
> Andre
> 
> 
>>   #define SBSA_GWDT_IMPL_SHIFT    0
>>   #define SBSA_GWDT_IMPL_MEDIATEK    0x426
> 
> 


