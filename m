Return-Path: <linux-watchdog+bounces-4516-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3AEC370B9
	for <lists+linux-watchdog@lfdr.de>; Wed, 05 Nov 2025 18:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955766460B5
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Nov 2025 16:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EF3242D7F;
	Wed,  5 Nov 2025 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UVaDK9X4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F6321448;
	Wed,  5 Nov 2025 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762360649; cv=fail; b=D2Fg+AQs3zs5vETi612ba9iVXsWBikTQlf3mm+Nt2NJbyGDLEseJ5tSTc8lxaCEPwiyOUaVZRQV27zX4wpMGRucORV4Jn6ac6c8iJqkSipBtIze0/LhqnvBIgOfrdvpqFphUqvFHJlqYEP5SrQRE0dbRKRkaTKh8ZWzSdF7TdAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762360649; c=relaxed/simple;
	bh=dhBAKHyT4CwjvUyH5mJM3QRwyJ8O33sPLaoUpwzoTKg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HHBRyvDvEr9Ab8D6IGSNN45o4/24tZSgxHPQZx8yBzPJUMYQg3YX5Gv+G0B+8loFhH4AHIDrjjTP4J27hTLQV8+XcgA68CtEmd8N9lRNPs6qaZvlNPMOpLeNhhejYXTklXFHr5XwIZwNfgcWae67ztuyse/za7hjm4zhhdvukos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UVaDK9X4; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwqRqvqJDNZZthuwSzKXnMOXRzP8iXHPK242VA6rTi7BLIqxCYMgshluMzhZRk1xB8xQ2N0eJfyAZVbChWBLTsvYb2hnnXKyE4wS/J7okOYb8iqPKYSqoYzDllhchLRNInwa8Y2qBtLLo8SHG2RlqV76TU100k04PcRLY2ydkPxlbG0lIw6d/nSbcO8Lm1anTgtAqZhRNPhPnU9LRQSDDuCnwt09NVIfbSBnZfvSbePetMNIttOYOZUDPYJ/rFUsdsiUr2u96jH8hSSY5SVJBHT7M2HqYKxtPJcMmjo4SIup98k1lygWzFmVzZ0I5BLIc9HA0pJSCXFzhBgVNUK7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IG8e6yHM+XrBzzdwz3ar9usi7Grd5sGPLSSGX2SRiv0=;
 b=oU8zfntjjSeS/cdcM2JQLI463Tu26nVaRPrInHHqBZ6FwQdY0mzdu+BXN0dBBEIRsUT0tbwUojnl5WwYym4SC3+I5XBBBiD+YHBSeWe0pPNznYWUigC1K/1OYC/ybERlAm8krM0OXaNkrQGb/qwXJrIAbkcT9bVD11IIBdiu0CEG6UTUPWxoyklpwpfeOZFfPU63A0VqX1irxMb5ZK4t+fxbyVp75VVxTr4BaCjxtCLjO4nnTMzeqjXi0QkSft+y4t0ewLV+L7Gjp65oMMEdpiBmA0mZPjuSHDa/fQCk50dnPWXLNOo31y6Kx0JuaiSaTbJWvdhVpVL65H1cwVRX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG8e6yHM+XrBzzdwz3ar9usi7Grd5sGPLSSGX2SRiv0=;
 b=UVaDK9X4F2ppg9J+MTc9m3ybFxEriOUdcLdmRtt5fIiwHSMn33UcdPjVIvJsYmn6b588Sxhlw7D6Isz8UO8qdstzRPLYterorVbMEi4z2iB/3eIwsup6Nbdk25PznDd9QFzlGzEfUC8bmpV7lACyWyMIYZIoHC+Y1gmeYFqJoCyVRJdghUe0+mLzNmk6WFKx7D5E/DWFqczbaIllHIzE2x06M66gGSNHbq5H8lCmHcnzkIqMkcGiGugRAHydMhf8JiJlFRHUwB7XjjPL0MJjZINxKzrj7uEHNsAAc5dAcBk8pzyeBrHooXEAe5w4sufJh7dmW4O/zj+NjG3Pcu3kEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5305.namprd12.prod.outlook.com (2603:10b6:408:102::5)
 by PH7PR12MB6738.namprd12.prod.outlook.com (2603:10b6:510:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 16:37:22 +0000
Received: from BN9PR12MB5305.namprd12.prod.outlook.com
 ([fe80::e7a3:9531:f0c9:bd7f]) by BN9PR12MB5305.namprd12.prod.outlook.com
 ([fe80::e7a3:9531:f0c9:bd7f%7]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 16:37:22 +0000
Message-ID: <62e7db76-6baf-45a3-8a45-eae71a1b53c9@nvidia.com>
Date: Wed, 5 Nov 2025 08:37:18 -0800
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
X-ClientProxiedBy: SJ0PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:a03:333::35) To BN9PR12MB5305.namprd12.prod.outlook.com
 (2603:10b6:408:102::5)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5305:EE_|PH7PR12MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfb77c9-4dd9-4597-289d-08de1c89986c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnQ5d1FlN1k3b0x3WTQ1WFJrbmNZZll2U2xZN2o3aktmZ0tnT2FjS2pVUktV?=
 =?utf-8?B?c0JBak1vZHYwNEZ0cFJ4ZFk1a3lMMmNiTzhjM2xCcmc0dzU4RDRLSFh2Q3hi?=
 =?utf-8?B?b2U1NkovanFIVGZXTEN2Rk5HWk0yeUNXZW5hZTlVaU9LRzFpdVdFTGZsd1J3?=
 =?utf-8?B?R2dMcmZQSU1PR2hPZUlUVFFYMkNxcWpZOXpsZmVlZGQ5YmdVcWIxRUNnMHFp?=
 =?utf-8?B?eVBkTmVkOWNmMVIxbisrRTUrQnkrYStaVVFWUEFNOHRNRTZMM0FoQkZlOTVp?=
 =?utf-8?B?RVEzaDVUL29UNStaN0kraUFTVzNBb0xCUGI4ZHVkOFRiK01NS3dDOGtJeVdq?=
 =?utf-8?B?OHNJMExzWHE5WFNIY21xVXJpdVJ1NStJdjg2eEdqazlNSFNYRHFBSlZuL3Ri?=
 =?utf-8?B?UU05TkszNnhacjhWZmkwaXFFYWlISHIvY2VFUDE3ZldJaHRCV2NDSS9VQU93?=
 =?utf-8?B?RVIrNzNVTi9jdUxOWWRJNzdJK1crRk9nS0MyOE85WUo2azcxQ3h1SHM0Z0d1?=
 =?utf-8?B?cDhqdjY3ZVc3bmZ6Y3g0K2Q2TkpST0FsbExYVFVZdURzNVNJVGZTeEF6aWds?=
 =?utf-8?B?SjN2bC9FeXVzVWt3M0d2bDZldkxyajMwUmgrUUowUW0xOE9KK04vZUtOQ3lB?=
 =?utf-8?B?TEQxempLZVU4NUxrQmliK1BuOFM2UVUrMm80Q2F6c25jWnF1YlRmS0ZBVGlC?=
 =?utf-8?B?SXh2TGNIK21zY2JvMEszL1RkOHN6WjZPMFRiaGVYZ3ZrR2hmcXlaQUhrcnV2?=
 =?utf-8?B?L3VzWDhFS2pPTDFBcXBwMGY3c0tQbjlVYm14cEdxcUJLcS9MV0daL3VJZHlT?=
 =?utf-8?B?ZmxZQkg5V3BjalBPYmdFMWJtdzNkZmtxOWlYV3FoVjJiTml4QVZaUW5kS2pw?=
 =?utf-8?B?aFEzOXFIdkl3VzVaK01Sb3U1ejFzVXp6S1ZqZUsveUl3T1JaTUw2eGQ0V203?=
 =?utf-8?B?ZjZkeUJhNEcrVHQvUnVaY2xoc3VYNnV0RWRSSEJnaE5xME1aOXJpSzg2dlp5?=
 =?utf-8?B?ZmpRMzhzRFh0cGhRbkVYenJCNjE3Kys5Y1dJakg3YjhyKzZ0UnlRTit1MEM2?=
 =?utf-8?B?S3NPaW1pUERycFg5MEV2N1huN0J1TFBtUnp1cWlZa1crSFZ6NThlQ3hvVlcv?=
 =?utf-8?B?S0FEOFl3aTM3N2FGU2lPYW5qVWpJZFZJTDVVbU1WMjk0YXVKNXpSeVZSVStm?=
 =?utf-8?B?YXFqenhkb1VnZGFjSE1sY1pXUWhxVXZIMkFBYklCVHVGcWRKc1pZbTFCSEY5?=
 =?utf-8?B?cHJscjRad2hmMXE1LzkraklNM2JLN09mdy9ZUVhvNW5EMDdoWXMzYmltWXg3?=
 =?utf-8?B?bEtCbjJqS3p5NmFFMmVsU1B5ZWcyVk1sRlFHUVVEMUhwSzA0aW1zb1BCTVJP?=
 =?utf-8?B?aXZCaVhhZ3VyNVJpNUVQOGJtZWhudzZic2t1ejFiZEwzeFZlZXZwazcybkNr?=
 =?utf-8?B?NlVDUUVORmNyckh5MlN5dTRMbDQ5WjZtTllvTkRKOWVpajNNVWlma2FGZXJn?=
 =?utf-8?B?L1kweWtKNUJjRndnRWoyR0xvV2RzS3l1NFFyNDhYSFU3YTAxMXBMRnB0ZkJH?=
 =?utf-8?B?ZXRsME01Sy9nQzBjYWV1RGNKZUtGZFNxS1RmaWlNM0ZldlFzRytUNWo3YlA5?=
 =?utf-8?B?M3ZqTjd5MUpLR3Z4b2trWmRTMThFbFBnSzdWUXNJbHV3S0xLc0lYeTJqMUMx?=
 =?utf-8?B?NjRzdXdvVjVyanFlanhIUC9CNGJuc1NML0h0c0Z4bytMYzRla1ZZTm1oYjIz?=
 =?utf-8?B?NVNhS0dHbWl2M1oxT3FSZFFqNzZJOGl3VEhtbHBVbU1zMVZSSmpON3ZtallG?=
 =?utf-8?B?QXlRSkdWL1RpVHh6ek13RkJJSmNadDN3OVlnWERZdGpyendJL09HS1JNLzBR?=
 =?utf-8?B?MlV0YTEraE1SY1A2L1dNSTFtQVJLNzVOSlV5cWtONVdsam0rK00vUzVlTGxU?=
 =?utf-8?Q?fQCHIsVMDUdLHsZa2lQ5/P3rNhlaEQeJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5305.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXl3TngvM2R0dEdYdmlPZE1rQUNvVTF0cHlHUXJObk9MbjZnTm9WdFk0MUJB?=
 =?utf-8?B?TUpORmxZejFXZ29IWFgvdUE4OVdHUDFJQ1R0bkx0UXV6eXk3S2Rkb01PdTFm?=
 =?utf-8?B?Q29yVFpGS09qWWUwUm03K1ZYYzkrUjYwclprcU1SZ0V2OTB2S0d2L3FUMVJj?=
 =?utf-8?B?SDVpVGhiaE1JbERmSVZ1eVd6T1E3UW04WDNkK2MxMFY2YlZLcTJNSFhoTmNv?=
 =?utf-8?B?ZFRPbW1yck9ibnpBYXJLWk4wQUJVMGpjbEM5cUtydWdqb2taUkczeWJ2cEZl?=
 =?utf-8?B?eU9hZ091dS9RTFQ5L0VqZnpWd0pSQSsyRm8ySGxEWlJqRk5tYjhabkNiS2lH?=
 =?utf-8?B?RUJmREE4L2g4MExLYkZZcXg0R2hyWXphT0Z5YWEzRmtGRTN0TTdSVkVYeitQ?=
 =?utf-8?B?d3Y5T1FEY0NnYys4N0FuZE9sS1NkeFpJRTBMT3l0aWZUdUI5NDBFMW5oMk96?=
 =?utf-8?B?aGpuUlRuYnBQT2RzcXI2cjltZTBNYkljQ1kwSHZvL0V5K0Z2WjVVSVI1ZHh4?=
 =?utf-8?B?Y2xKTHZsWnFoSGdFSmpoT1FlSWcycCttdFJJQ1ZwZXMwZ3ZMa2RJQkNLNEZk?=
 =?utf-8?B?cCt3U3k1MXpRT1kzYnIvalhqMkZhc1M4SXhsUUdrNi9DZzhvMHN1Q0hTakVV?=
 =?utf-8?B?UUdrY3FIMUpHSmtFeWNqNlNBTmc0VktSQWVJOUNiU3A0bU1JZ1h3V2pkSzZ1?=
 =?utf-8?B?c3VPVERLTXpnaVlrSFl6T2o0K2owNjBqd3lhYmkwSlpxay9sY1FkNXR5VzBx?=
 =?utf-8?B?OVBaV2MvSHIxWkVRdGlpZzRGbmxFQUd1OU14SFIyNVF5QzhFS3RmRjc2bDk5?=
 =?utf-8?B?R2FEeFBSYStTN2FtTlRxUGluelloR25lYjRJcE1jWUJ6cjJka3hiR0p5bUc5?=
 =?utf-8?B?NzQ0UVJKRTNmVFgwZmdMMWoxT2RMREY4MzE1U2xpT0J5Q3NKdm9UK1VESkth?=
 =?utf-8?B?OEU5RTY3aDh2Y203V0FqbnJPbFplT2JxaFdBNUNXdnpkTnN5bmw1S0E2aEJZ?=
 =?utf-8?B?cVNTa1RtTjlmR2Jkb2djTm50SElRSlV2UjM2Y2gva1QraVhkM1VsNnNBTzBt?=
 =?utf-8?B?Nmwza05yZFBYVHcxaGE2Wk9VeDkzS1JnUEErSkluTVpsZ0VwVVNvU2E0ejdk?=
 =?utf-8?B?SlUrdTByK0p1QXZIRHI2OVY2R2lkbXZvZ0k0amNQek5uSkV6dHh3SVdBa3N4?=
 =?utf-8?B?RDg0bjJDeU8yZzVmNEp0QzU2UDJOV3cwVGFpcFJpWTJOWEpuUUpzWmtSaGJV?=
 =?utf-8?B?QzhCM2hTM3VCOHdUNjdmYU85K2MxaHg5UStaYVFkOEhTQWhzazVpa1g3RkVK?=
 =?utf-8?B?WjVGTjIyeVdGS2NmT1VjYndQRFNHN2tCYkVEeVRzaVpUZEdTV2N1eUdtTTRL?=
 =?utf-8?B?S2RXUE9KQlh5QnJoWXJkamI3WE1qaDB0TlljWEQwS0g2dE93SzI0TTdRYzkv?=
 =?utf-8?B?ZWl3QkdMNCtjaXNzVXVyM3FLSmpMZ0hmYkFSdTNUTDNNTWNYSjVxT3VrTldH?=
 =?utf-8?B?LzlXdWgveVNNYktzSExsaXFoL04yWXVmclN6NGVEcUZsbkpLSWtPZzBIY1c2?=
 =?utf-8?B?bmFwaWJUWWx6dG0zaU95MzV2OE1HdktPc3JYWnlGcVpQZUJPTm9ZV1NCRm82?=
 =?utf-8?B?TytKLzJQcEttZGdkeDRlcDhXcWhaTXF4THdZUERZQzlWaEVwQndIbEpHL2hz?=
 =?utf-8?B?RUtNclZsRS8wNVZCUkx3T1BtejcvcExDRy91TkxDQU9LUHJwQXhzbzJ5d1dZ?=
 =?utf-8?B?dktXVU5JTnVpT0hJTStUNnpyTm90ZmdOeXhVemNqeUdub2RmV0ZVTmFRYlpr?=
 =?utf-8?B?b0dXeTZ1V1FzaWx4Qk5OUFBsWVVxNmtzYko2ZStCU3ZTVTRzT1RGenVCY3lR?=
 =?utf-8?B?eGtDL082KzY3amhDU0VJWCtqQXo3VEFlY2ZZWUkvTlptM2xqQk00dVpwSnZz?=
 =?utf-8?B?TGtadTBzRUlqUE5tYTBISWZ6SDdLTS9BL2s2bDV6VEp5aHh1RkxVWUc2RE84?=
 =?utf-8?B?KzhUMCtZejhVc25Za2lkTjBlcmFFdXRCa3dpbXB6ZkRnSlpLYmV3My9PN3VY?=
 =?utf-8?B?K3hUK3E3UEE4bDFVYVlJbitndmE2VVExQmk1V3BVdzN4SmtmeGdYVGVjVm9l?=
 =?utf-8?B?bVZ6LzhIbDBEeEt3cU9OUVpWNWwyMkRaNEZEblpuMGx1ZEFQaElXZDFkTzU2?=
 =?utf-8?Q?Dq6WuQCiP+Ca6cupbs8CjUU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfb77c9-4dd9-4597-289d-08de1c89986c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5305.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:37:22.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bdk2jtFdw9MVsIrZZziLS3+ZGYuwzip+ky8JQXAoHz4T6L+ADXsh6G42kXOtxVqcZrArUGQJwsRpW0LgMfHhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738

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
> Well, looks like a simple off-by-one bug, doesn't it? And nobody 
> noticed because it only affects vendors in the later JEP banks, and 
> the only user so far is comparing with 0x426, so it's not affected.

Yes, I think you're right. Sorry about that.

As far as I know, there isn't a 0xc26 assigned so I doubt anyone will 
run into this. And if they do, the workaround it applies has very low 
impact.

>
>>
>> [1] #define SBSA_GWDT_IMPL_MASK    0x7FF
>>
>> [2] Implementer, bits [11:0]
>>      Contains the JEP106 code of the company that implemented the 
>> Generic
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
>>   -#define SBSA_GWDT_IMPL_MASK    0x7FF
>> +#define SBSA_GWDT_IMPL_MASK    0xFFF
>
> Can we please use GENMASK here? This probably would have avoided the 
> problem in the first place.

I'll leave that up to the maintainers, but assuming they're okay with 
this quick fix,

Acked-by: Aaron Plattner <aplattner@nvidia.com>

-- Aaron

>
> Cheers,
> Andre
>
>
>>   #define SBSA_GWDT_IMPL_SHIFT    0
>>   #define SBSA_GWDT_IMPL_MEDIATEK    0x426
>
>

