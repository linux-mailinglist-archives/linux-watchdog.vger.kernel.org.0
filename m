Return-Path: <linux-watchdog+bounces-1050-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D144E8C00C2
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 17:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882C7287797
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 15:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D6A7BB0F;
	Wed,  8 May 2024 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lySwZnk5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3A31A2C05;
	Wed,  8 May 2024 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715181437; cv=fail; b=tHRNvIrLE93aJ2Z6OeegbXL6C9tO4YTJ4MB2IyzJvLmXMNvYsZ9A3Uba4Fb4koexbt0z3kErU5ZC9tSkpoRsyph3/hoHUWw8MPAaG1G7f7T1JOfYC09QzHpJ6kazpd/0n4obINI6Ymt52QDsT/SmSlXRpH9DjaDsiWOkMIc2Dts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715181437; c=relaxed/simple;
	bh=RdTRTnMVYTZCy219lvx4XjzCtDctzyjYZs7fKwWeCco=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bz2L8e1JWBLBFr1I+FTo/hZPrFNIk1RyUXCU2fwm60x55oHY+WqCt1X8swoZNgn3Tg+i8h80nb+FhPujsl66mI9qyzbDz689/WPR579lEWarnDirbFKw9R/UY1JeP/fPPIzGzxB/AeENwMcKH6xikwKzQvEOCZ1xHJdEcWMfZCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lySwZnk5; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmphS2zIrrnVm+VRBkkUevEGdf8ANFSrKU22DW7w3/NygyTIis6FalpjWKIuejOL1n+TgWgnKG/hPV6hQVTfGiKxmNbzepH1zW1cUD26vaPXsA+WKwOqEmGzCl8Z4DI04h76TuJKCpY+Ff6KwpftTtZqKQB3nOiJ9ARMmSIcBKmuN5qonPsitwYK1zFDNh1pvUgKMN5kQnmAbZAYIMnUqbS9yN7dvnaWwd2bJibVvYCBI+KVde7gp4ENPFJogLvrJSS/h2jBaRAMLeL1WPfk49/4aNO9LBNN+agkdKwBfLZOLpkUsctS4GM/eHRAw3K/VJ4uxTmBVRCz5/PlT0q0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdTRTnMVYTZCy219lvx4XjzCtDctzyjYZs7fKwWeCco=;
 b=bo3TltFgsTZcX0nUHgkE8FwIIRGFCc2FGgRp/Y3YtF4pQoO5K0Ku8k7BrH76BAJxuHJU4eB/iBfyVtncW6S/7L0vOz4NtrSAnRI1Nx/eU3Sz+XUwHqrAVnp4spYtM9Bi5rMTsG3j6UGX0IgGW1N13zmuCT+A+stixXBlleVQ5Wa/eErsuXffALRXKzqyVHgV0Y9R/mp2uNXX1r/d8NeoebBjl1aa/BpvvXdAuwnpx3WoN4bDcRQmYPpb6Ej2Hv2HZVIkeBA+gethIjqUU4FAVrXT4TfQgk0fqQLQ6Xexh+dsoNscZkHNZFHjgIPFDdh4SNeZLG5BbAfQh9ZoiJGCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdTRTnMVYTZCy219lvx4XjzCtDctzyjYZs7fKwWeCco=;
 b=lySwZnk5bOwRIBy4EvatV1746D4a3wvpgxIZTlsmSSsDVT8R4Rr2L4c4MX49kV9jA2aD7mb2ZwDUvi6ZcvmPmEAVO10WOD4UqGIEufEJp8K///B+riktd73N8p96HNG8WM79o7DpntoZeQJkM0OF6NNTfIqb4VaN/OtQHcA9lks=
Received: from SJ1PR12MB6076.namprd12.prod.outlook.com (2603:10b6:a03:45d::10)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 15:17:12 +0000
Received: from SJ1PR12MB6076.namprd12.prod.outlook.com
 ([fe80::415b:4f92:5791:b46]) by SJ1PR12MB6076.namprd12.prod.outlook.com
 ([fe80::415b:4f92:5791:b46%2]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 15:17:11 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, "Simek, Michal"
	<michal.simek@amd.com>, "Neeli, Srinivas" <srinivas.neeli@amd.com>, "Datta,
 Shubhrajyoti" <shubhrajyoti.datta@amd.com>
CC: "Goud, Srinivas" <srinivas.goud@amd.com>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH] watchdog: xilinx_wwdt: Add check for timeout limit and
 set maximum value if exceeded
Thread-Topic: [PATCH] watchdog: xilinx_wwdt: Add check for timeout limit and
 set maximum value if exceeded
Thread-Index: AQHaee5c93zAI0SES0y8u+MbEpKqMrE/GZMAgE6oEtA=
Date: Wed, 8 May 2024 15:17:11 +0000
Message-ID:
 <SJ1PR12MB6076D7F6F5DF8A6207966C7492E52@SJ1PR12MB6076.namprd12.prod.outlook.com>
References: <20240319111219.21094-1-harini.t@amd.com>
 <8e4c2d5a-9f28-4946-b69d-63f5af3bc3da@roeck-us.net>
In-Reply-To: <8e4c2d5a-9f28-4946-b69d-63f5af3bc3da@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6076:EE_|PH7PR12MB5902:EE_
x-ms-office365-filtering-correlation-id: ee2ef3cb-38ca-486f-7003-08dc6f71ef6a
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VHUxdzlCdTJDWi94bytWNWxPNnFSMjMrNmRKb2NVUngvSklPb2J0cWQ3R1Ay?=
 =?utf-8?B?T0dnNGdVVE1FOFVSaTB1c0NaaTFycjNLaVpvYWxRR3QzYXBmKzBQenlueHBR?=
 =?utf-8?B?dFBQVTZuL0F3RDZlcU5aUCtpMjVudGxYSitCUWY0SGQ5WkxDSlh3WThqTjFC?=
 =?utf-8?B?VEsvL0tUVml2TUhjQUZxZVJoVmxDMlp0ODlySTdueGw4cXl1TEF3NS9KdDdM?=
 =?utf-8?B?SGxxWGdEZE5jOFdpWFJMY0JXTlg0Ylp3VzVXU2xhWnNJY0V3TXY0YkJ2QlJs?=
 =?utf-8?B?UzNjaEtBL3M0eElSeEdaR0NtcFU2WENlMnpyWENnZFJyVU5vSE1xTVRLS1la?=
 =?utf-8?B?dTk1Nk9xYzZXM0Fjb0d0cXBnMGpDemk3SG9vZHpxMDRyZWdKU2F4UXdCQTlX?=
 =?utf-8?B?Z1ZhSUwwWC9XajhGN1FxZjJHOWdxYVVtYnpoRDdHaGdFV3Nqb2EzU28yV1Vy?=
 =?utf-8?B?THRZQmNFelFTNm9ZdTJpUlQyWGIrTEdyM2pqTm0ra2Q0a0t4STEyM3hGUStJ?=
 =?utf-8?B?d0dGdk14TE5mNUtGL01hWVdGQjdidlhoUjRNd0tiYWVZc3Ftejh3c1lWdEZW?=
 =?utf-8?B?K2NDbUZkNi9jV1NFYm1iS21EL1g4QmREYnpCeHpPcTgwYlc2dGV2a3R6cFpF?=
 =?utf-8?B?NlpYV1J6RjVqOXRSa2d1V2pqazI1WWJJaDFxbFZSWEY5bHJhVXNSN0ZXclJ1?=
 =?utf-8?B?cXp4RWdma2FhZDU2bTRZMEd3ek1ib2wzUFEzTXZRWU9MQzkxQkRMMjRHR1FN?=
 =?utf-8?B?ZXltcmJmdVRIV2hkVVVHOU1hdThNdUZZVzhsa2kyTmIwMm5CWGZ4SFEvMDJa?=
 =?utf-8?B?L1djeVowc2RBYlZ4RkN2cTVZd1pxMTVXblpPT3FoSGhINmZ3SWl6NnRwRlZW?=
 =?utf-8?B?WjVYdmE0Yi9DY1FjOXhNS1pFTHBQY2RYejNtaXVuK2hUdGlQMlJnWnJWU3RF?=
 =?utf-8?B?NFpMMVBmSHZmeGJiQWFRNFdLMDJySjlDMFNyaDdHUTRoVzJxMXlGV2U4SXow?=
 =?utf-8?B?d1ZZMm1PcUhQeDFLdXJSUzNrUnEzS202UFFnQ1JzTnpxMTR0VVhlTEFyaTFG?=
 =?utf-8?B?Vm5WdVp0NElvR0FQRXdqN3QyNDlSMGRTWXVIdk93OVpzZU9QOXEwSHZucThh?=
 =?utf-8?B?YVZNSjlnb1BmZUJteVJBMEFBYTE2WTNiS05lT0VhZjg4aVV2L25mWWpYNDMx?=
 =?utf-8?B?Zkw5WjBCSGlEbEg4RVVLVFV6NFA1S1ZBM1NCR0RFNWErTVkyL0ttVExKTzYw?=
 =?utf-8?B?STd4RGZWZmtodzJBOWtGNlBuUTJOZ0djWnpZSzlTdzZ2TjJ0ZG1oK3ExL3Zr?=
 =?utf-8?B?am1sN28zcTNDYlo4Z3NqR0VialhoTTlmdmlYOVZyWGJ6QURKOGk0aDd0Yjgw?=
 =?utf-8?B?L25rOGIrSlplZVZyeDFPdDRiK2JQekVWMlVDK0Q5dEFYS3RGZ0oyc3o5Z2pP?=
 =?utf-8?B?SDBqSU94ZXNiME84eHdIdXA4OTNwMUdmWXl2djNxVnlXN3Q0TTdiVFBhYXgy?=
 =?utf-8?B?Z01aeExWZXhpN3BnMDgwV0RIcGYrR0J6QjZ4WnFSZ214Z0VsME1ZaEhGVmxL?=
 =?utf-8?B?WGRoSkZQUGowQmhReXArcEhEdk52U2JkMjhyRm9ySHhWWHdHVHpDaUJEQlpG?=
 =?utf-8?B?WlNUeE5lV0w5ZVdPaUVxdmNlVkpIUGhRcmpESHhYblN6QzZLN1NjZU5lMEVm?=
 =?utf-8?B?d1FxKzRoUTljdE04UjFNWFNlV3RCNUY5UW15cDF0NGVmLzVrelhJNEw3OEVh?=
 =?utf-8?B?VlQyc1kzUENncVBIWDdOMUJYZ3lzWCtjVGY0aDdkN1JHUnc3RXVZcXJaZ2cv?=
 =?utf-8?B?SjVzODkwaUs0b0VaU2J3dz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6076.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UW5LS3BEZER3OWhEWmhGZ0lubytlNVFsQWMraTZtLzlmRzQ1eENLQmtZdFN2?=
 =?utf-8?B?Uk5JUytLaFp5c1ZoY0lzVjZ3TFMwVXZkWUZmcTM4cjZ3Q0kzWHJQVkgyaktC?=
 =?utf-8?B?UEZHWFY3QTlIZTl1NXRzeVFJNkw0dkVIb1FmY2Q5bVNnenlXS1BHci9USG00?=
 =?utf-8?B?SlF6TlN1Y1pBelZFVzBOQ0cxdEt3RGFjQWFSN3JJc0x0L1VOKzdNWVBjQUhR?=
 =?utf-8?B?ZHJOY1RGb2wzcnZITVdmL1NEUk92RUZMcExoRytWK0N6WXBjcy9pTzJ3Z25p?=
 =?utf-8?B?NTBSTWt0VTBYbXlDOXZFN3A3MzJLUWJwRVFTVnh5Sm5SNllIbEJtaHBWR0ha?=
 =?utf-8?B?QksreFU1UThoc2k3YUdNaW1ScjF5RldhMWtkdkdhM3lpNXIxVHg2a2pDRUlN?=
 =?utf-8?B?TlN4QTJuYUZpazBNUGpYVnhNSEpyZEhPMGg4cnVlRnVycHd2VlVpdEoyWGRp?=
 =?utf-8?B?YlFFMnJjbXVkL2Z4dnZMQnFMdFBZRWhIcHRGTTBLMFM5MDVzZ2lKR2YxTW91?=
 =?utf-8?B?L3REOWMwQVNBNFdJTmVoamVsMU5MSTc3UjU5UHF6bEkvbnh3eHNsdXFYeUhu?=
 =?utf-8?B?SlplbWJrK0ZHQkNtY3lLa2V1aVA0dmxwYVAwT3NlZ1l0SVI2bXJ0NUxncE9i?=
 =?utf-8?B?UUVYS3c3VDlnVFJqRkh0YkZ4MkhrRGVBaURaNlJXd3BzNmFhQzNPZmhHK0ZF?=
 =?utf-8?B?MDZiWVpSMXYyMFhmaW1SaElLcWxIaVRrbkV2ZVJoVnc2N2ROOHRaK0tBMVo0?=
 =?utf-8?B?QkIrQ2wxUU9hcHk0QzVvYmtWcm85eVVXZ0txemZJWkRIRGJXV0hxQmtLcVRk?=
 =?utf-8?B?REcybHlOS0pmcWtiUnlqN0YwSVgzYnNacG15WlY4TG04RVV2S3l2ajZqTWo4?=
 =?utf-8?B?eHpwS01LQXBCdUxoQkliTmNhcEM2TjlteDRRS3c2aDAvYU9JUnVDeVBDaFhx?=
 =?utf-8?B?MHZUeFpGUjZkTE9ldTJmSDdlVHhQUktaOTZzTiszWnNnRm8wV2NnWlNZS1lR?=
 =?utf-8?B?Z2pqWVRRbXN5bHFxYnlOSmZndXY3aTVqOUpjeTQ3RmhxTlZMTGJBdjdFTHVr?=
 =?utf-8?B?bU95UHNiMVlpaW5NYS9BQkhHZVdOK1hudyt1eWFTUlhsTFB2aU9sVDFnLzdX?=
 =?utf-8?B?MGEyc0svRXRQM3VxOExBbUZOaG5ybC9NZWpmN21xODF6RU9EanBPdTlmNU1j?=
 =?utf-8?B?ajYrRUhnTUhIaHZ2NFFETXcrZGZjQktPR013Z3FpNUQ1RUdvSkpTNGl5dDgv?=
 =?utf-8?B?ejFkY245RXczYVdkMWVKbzgzOEFwbW1MbUxqbHkzTFNya05KdEFvZzdhK2dl?=
 =?utf-8?B?bzRrRWU3ZWlVNnhRcTEyZ1ZuT2xTczRVVVYvL2I3cVFzN1dXSDZGVHg2cm1k?=
 =?utf-8?B?MFNkNkVNZElsdDM5QURUYzM1UjdlY1g4WnRoaXE0ckFHMm53bUVuZmVWdHJv?=
 =?utf-8?B?Mmsxd1RVUkdJV0VUcTBuc0ZXaitDL2ljRFBRU213c1VXeFRWaVQwdjkyWUFk?=
 =?utf-8?B?SThDTHllZUxleWJoK21CMDJRc3NrVjhhOHR2REF3OXAvR2RmRUdvTldYaURO?=
 =?utf-8?B?cCs1V0NhUjUrdGw0Nk5qWndFQjlRNnVIWnNPS1JMdWxiWnd2dXhKNnp4a2dW?=
 =?utf-8?B?T3lkQW1ZckdLTmtlT0lHcXRxU3JnaDRIcWFGcmxXNnZ2RlZXbXA2b2IrQ1dq?=
 =?utf-8?B?YUYwSnZnV0hWWHY3dWI2eXdMdUFQZm40R3dRSEhXSDVCTXYxeWVITWYxdXo1?=
 =?utf-8?B?UUtvYTVXN3hFYmo1eFA3alVVZDRuN2hIYlZ3dlh1enAyejVOVVdkMFNDampI?=
 =?utf-8?B?U3ZuR2FlMVExc0xnSXhzT1hFYTBYUzZUdzNia1NQMG42ZGpjb1Z4TVN3eWFY?=
 =?utf-8?B?NGtsYXJSTVB5RlRvMWp2NE84NGZkSm45ejZMbEFyT1RoeXE5N0gwOUdkRmxs?=
 =?utf-8?B?Ni9oZUZwZFRhZnI5RU5NUjZJcUFNMk4rYUV2TXNhMGJqU1IvcEkweVRkSXl2?=
 =?utf-8?B?ZCtMbGFVeEZqdkhxeTE2SmpHVDlpUmVBYXNRaGp4Qm4vS3RtMXcvNjExd0dt?=
 =?utf-8?B?cFNXMW9RSnNJdDQ2aGM5YnFLWmticHVmQUxBYVc3R296cHA3R1c3ZE9zL1NK?=
 =?utf-8?Q?fJIc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6076.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2ef3cb-38ca-486f-7003-08dc6f71ef6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 15:17:11.7899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GmLF94UtaimRjd0yN09x6iSx1XH3GwiX//GMoTkPhGBQbZjolm7+4tmkMy1hSRPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902

SGkgR3VlbnRlciwNClRoYW5rcyBmb3IgdGhlIGlucHV0cy4gSSB1bmRlcnN0YW5kIHRoYXQgdGlt
ZW91dCBpcyBpbmRlcGVuZGVudCBvZiBtYXhpbXVtIGhhcmR3YXJlIHRpbWVvdXQuIFRoZSBvdGhl
ciBjaGVja3Mgd2VyZSBhZGRlZCB0byBwcmV2ZW50IHRydW5jYXRpb24gb2YgYml0cyBpbiB0aGUg
cmVnaXN0ZXIgd2hlbiBpdCBjcm9zc2VzIDMyYml0cy4gSSB3aWxsIGZpeCBhbmQgc2VuZCB2Mi4N
Cg0KDQpUaGFua3MsDQpIYXJpbmkgVA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgR3Vl
bnRlciBSb2Vjaw0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxOSwgMjAyNCA3OjM3IFBNDQo+IFRv
OiBULCBIYXJpbmkgPEhhcmluaS5UQGFtZC5jb20+OyBTaW1laywgTWljaGFsDQo+IDxtaWNoYWwu
c2ltZWtAYW1kLmNvbT47IE5lZWxpLCBTcmluaXZhcyA8c3Jpbml2YXMubmVlbGlAYW1kLmNvbT47
IERhdHRhLA0KPiBTaHViaHJhanlvdGkgPHNodWJocmFqeW90aS5kYXR0YUBhbWQuY29tPg0KPiBD
YzogR291ZCwgU3Jpbml2YXMgPHNyaW5pdmFzLmdvdWRAYW1kLmNvbT47IHdpbUBsaW51eC13YXRj
aGRvZy5vcmc7DQo+IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgZ2l0IChBTUQtWGlsaW54KSA8Z2l0QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHdhdGNoZG9nOiB4aWxpbnhfd3dkdDogQWRkIGNoZWNrIGZvciB0aW1lb3V0IGxpbWl0IGFuZA0K
PiBzZXQgbWF4aW11bSB2YWx1ZSBpZiBleGNlZWRlZA0KPiANCj4gQ2F1dGlvbjogVGhpcyBtZXNz
YWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXINCj4gY2F1
dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25k
aW5nLg0KPiANCj4gDQo+IE9uIDMvMTkvMjQgMDQ6MTIsIEhhcmluaSBUIHdyb3RlOg0KPiA+IEN1
cnJlbnQgaW1wbGVtZW50YXRpb24gZmFpbHMgdG8gdmVyaWZ5IGlmIHRoZSB1c2VyIGlucHV0IHN1
Y2ggYXMNCj4gPiB0aW1lb3V0IG9yIGNsb3NlZCB3aW5kb3cgcGVyY2VudGFnZSBleGNlZWRzIHRo
ZSBtYXhpbXVtIHZhbHVlIHRoYXQNCj4gdGhlDQo+ID4gaGFyZHdhcmUgc3VwcG9ydHMuDQo+ID4N
Cj4gPiBNYXhpbXVtIHRpbWVvdXQgaXMgZGVyaXZlZCBiYXNlZCBvbiBpbnB1dCBjbG9jayBmcmVx
dWVuY3kuDQo+ID4gSWYgdGhlIHVzZXIgaW5wdXQgdGltZW91dCBleGNlZWRzIHRoZSBtYXhpbXVt
IHRpbWVvdXQgc3VwcG9ydGVkLCBsaW1pdA0KPiA+IHRoZSB0aW1lb3V0IHRvIG1heGltdW0gc3Vw
cG9ydGVkIHZhbHVlLg0KPiA+IExpbWl0IHRoZSBjbG9zZSBhbmQgb3BlbiB3aW5kb3cgcGVyY2Vu
dCB0byBoYXJkd2FyZSBzdXBwb3J0ZWQgdmFsdWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBI
YXJpbmkgVCA8aGFyaW5pLnRAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvd2F0Y2hk
b2cveGlsaW54X3d3ZHQuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL3hpbGlueF93d2R0LmMNCj4gPiBiL2Ry
aXZlcnMvd2F0Y2hkb2cveGlsaW54X3d3ZHQuYyBpbmRleCBkMjcxZTJlOGQ2ZTIuLjg2ZTJlZGM0
ZjNjNw0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cveGlsaW54X3d3ZHQu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cveGlsaW54X3d3ZHQuYw0KPiA+IEBAIC0zNiw2
ICszNiwxMiBAQA0KPiA+DQo+ID4gICAjZGVmaW5lIFhXV0RUX0NMT1NFX1dJTkRPV19QRVJDRU5U
ICA1MA0KPiA+DQo+ID4gKy8qIE1heGltdW0gY291bnQgdmFsdWUgb2YgZWFjaCAzMiBiaXQgd2lu
ZG93ICovDQo+ID4gKyNkZWZpbmUgWFdXRFRfTUFYX0NPVU5UX1dJTkRPVyAgICAgICAgICAgICAg
IEdFTk1BU0soMzEsIDApDQo+ID4gKw0KPiA+ICsvKiBNYXhpbXVtIGNvdW50IHZhbHVlIG9mIGNs
b3NlZCBhbmQgb3BlbiB3aW5kb3cgY29tYmluZWQqLw0KPiAjZGVmaW5lDQo+ID4gK1hXV0RUX01B
WF9DT1VOVF9XSU5ET1dfQ09NQklORUQgR0VOTUFTS19VTEwoMzIsIDEpDQo+ID4gKw0KPiA+ICAg
c3RhdGljIGludCB3d2R0X3RpbWVvdXQ7DQo+ID4gICBzdGF0aWMgaW50IGNsb3NlZF93aW5kb3df
cGVyY2VudDsNCj4gPg0KPiA+IEBAIC03Myw2ICs3OSwyNCBAQCBzdGF0aWMgaW50IHhpbGlueF93
d2R0X3N0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UNCj4gKndkZCkNCj4gPiAgICAgICAvKiBD
YWxjdWxhdGUgdGltZW91dCBjb3VudCAqLw0KPiA+ICAgICAgIHRpbWVfb3V0ID0geGRldi0+ZnJl
cSAqIHdkZC0+dGltZW91dDsNCj4gPiAgICAgICBjbG9zZWRfdGltZW91dCA9IGRpdl91NjQodGlt
ZV9vdXQgKiB4ZGV2LT5jbG9zZV9wZXJjZW50LCAxMDApOw0KPiA+ICsNCj4gPiArICAgICBpZiAo
dGltZV9vdXQgPiBYV1dEVF9NQVhfQ09VTlRfV0lORE9XKSB7DQo+ID4gKyAgICAgICAgICAgICB1
NjQgbWluX2Nsb3NlX3RpbWVvdXQgPSB0aW1lX291dCAtDQo+IFhXV0RUX01BWF9DT1VOVF9XSU5E
T1c7DQo+ID4gKyAgICAgICAgICAgICB1NjQgbWF4X2Nsb3NlX3RpbWVvdXQgPSBYV1dEVF9NQVhf
Q09VTlRfV0lORE9XOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIGlmIChjbG9zZWRfdGltZW91
dCA+IG1heF9jbG9zZV90aW1lb3V0KSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9p
bmZvKHhpbGlueF93d2R0X3dkZC0+cGFyZW50LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiQ2xvc2VkIHdpbmRvdyBjYW5ub3QgYmUgc2V0IHRvICVkJSUuIFVzaW5nDQo+IG1h
eGltdW0gc3VwcG9ydGVkIHZhbHVlLlxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgeGRldi0+Y2xvc2VfcGVyY2VudCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNs
b3NlZF90aW1lb3V0ID0gbWF4X2Nsb3NlX3RpbWVvdXQ7DQo+ID4gKyAgICAgICAgICAgICB9IGVs
c2UgaWYgKGNsb3NlZF90aW1lb3V0IDwgbWluX2Nsb3NlX3RpbWVvdXQpIHsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgZGV2X2luZm8oeGlsaW54X3d3ZHRfd2RkLT5wYXJlbnQsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJDbG9zZWQgd2luZG93IGNhbm5vdCBiZSBzZXQg
dG8gJWQlJS4gVXNpbmcNCj4gbWluaW11bSBzdXBwb3J0ZWQgdmFsdWUuXG4iLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB4ZGV2LT5jbG9zZV9wZXJjZW50KTsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgY2xvc2VkX3RpbWVvdXQgPSBtaW5fY2xvc2VfdGltZW91dDsNCj4g
PiArICAgICAgICAgICAgIH0NCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICAgICAgIG9wZW5fdGlt
ZW91dCA9IHRpbWVfb3V0IC0gY2xvc2VkX3RpbWVvdXQ7DQo+ID4gICAgICAgd2RkLT5taW5faHdf
aGVhcnRiZWF0X21zID0geGRldi0+Y2xvc2VfcGVyY2VudCAqIDEwICoNCj4gPiB3ZGQtPnRpbWVv
dXQ7DQo+ID4NCj4gPiBAQCAtMTMyLDYgKzE1Niw3IEBAIHN0YXRpYyBpbnQgeHd3ZHRfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgIHsNCj4gPiAgICAgICBzdHJ1
Y3Qgd2F0Y2hkb2dfZGV2aWNlICp4aWxpbnhfd3dkdF93ZGQ7DQo+ID4gICAgICAgc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgbWF4X2h3X2hl
YXJ0YmVhdDsNCj4gPiAgICAgICBzdHJ1Y3QgeHd3ZHRfZGV2aWNlICp4ZGV2Ow0KPiA+ICAgICAg
IHN0cnVjdCBjbGsgKmNsazsNCj4gPiAgICAgICBpbnQgcmV0Ow0KPiA+IEBAIC0xNTcsOSArMTgy
LDExIEBAIHN0YXRpYyBpbnQgeHd3ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAq
cGRldikNCj4gPiAgICAgICBpZiAoIXhkZXYtPmZyZXEpDQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsNCj4gPg0KPiA+ICsgICAgIG1heF9od19oZWFydGJlYXQgPQ0KPiBkaXY2NF91
NjQoWFdXRFRfTUFYX0NPVU5UX1dJTkRPV19DT01CSU5FRCwNCj4gPiArIHhkZXYtPmZyZXEpOw0K
PiA+ICsNCj4gPiAgICAgICB4aWxpbnhfd3dkdF93ZGQtPm1pbl90aW1lb3V0ID0gWFdXRFRfTUlO
X1RJTUVPVVQ7DQo+ID4gICAgICAgeGlsaW54X3d3ZHRfd2RkLT50aW1lb3V0ID0gWFdXRFRfREVG
QVVMVF9USU1FT1VUOw0KPiA+IC0gICAgIHhpbGlueF93d2R0X3dkZC0+bWF4X2h3X2hlYXJ0YmVh
dF9tcyA9IDEwMDAgKiB4aWxpbnhfd3dkdF93ZGQtDQo+ID50aW1lb3V0Ow0KPiA+ICsgICAgIHhp
bGlueF93d2R0X3dkZC0+bWF4X2h3X2hlYXJ0YmVhdF9tcyA9IDEwMDAgKg0KPiBtYXhfaHdfaGVh
cnRiZWF0Ow0KPiA+DQo+ID4gICAgICAgaWYgKGNsb3NlZF93aW5kb3dfcGVyY2VudCA9PSAwIHx8
IGNsb3NlZF93aW5kb3dfcGVyY2VudCA+PSAxMDApDQo+ID4gICAgICAgICAgICAgICB4ZGV2LT5j
bG9zZV9wZXJjZW50ID0gWFdXRFRfQ0xPU0VfV0lORE9XX1BFUkNFTlQ7IEBADQo+ID4gLTE2Nyw2
ICsxOTQsNyBAQCBzdGF0aWMgaW50IHh3d2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ID4gICAgICAgICAgICAgICB4ZGV2LT5jbG9zZV9wZXJjZW50ID0gY2xvc2VkX3dp
bmRvd19wZXJjZW50Ow0KPiA+DQo+ID4gICAgICAgd2F0Y2hkb2dfaW5pdF90aW1lb3V0KHhpbGlu
eF93d2R0X3dkZCwgd3dkdF90aW1lb3V0LA0KPiA+ICZwZGV2LT5kZXYpOw0KPiA+ICsgICAgIHhp
bGlueF93d2R0X3dkZC0+dGltZW91dCA9DQo+ID4gKyBtaW5fbm90X3plcm8oeGlsaW54X3d3ZHRf
d2RkLT50aW1lb3V0LCBtYXhfaHdfaGVhcnRiZWF0KTsNCj4gDQo+IEkgaGF2ZSBub3QgdHJpZWQg
dG8gdW5kZXJzdGFuZCB0aGUgcmVzdCBvZiB0aGUgY29kZSwgYnV0IHRoaXMgaXMganVzdCB3cm9u
Zy4NCj4gVGhlIHdob2xlIHBvaW50IG9mIGhhdmluZyBtYXhfaHdfaGVhcnRiZWF0X21zIGlzIHRv
IG1ha2UgdGhlIGFjdHVhbA0KPiB0aW1lb3V0IGluZGVwZW5kZW50IG9mIHRoZSBtYXhpbXVtIGhh
cmR3YXJlIHRpbWVvdXQuDQo+IA0KPiBBcyBmb3IgdGhlIHJlc3Qgb2YgdGhlIGNoYW5nZXMsIG1h
eF9od19oZWFydGJlYXRfbXMgc2hvdWxkIGJlIHNldCB0byB0aGUNCj4gbWF4aW11bSBoYXJkd2Fy
ZSB0aW1lb3V0LiBTaW1pbGFyLCB0aGUgbWluaW11bSB0aW1lb3V0IHNob3VsZCBiZSBzZXQNCj4g
dG8gdGhlIG1pbmltdW0gdGltZW91dCBwb3NzaWJsZS4gQXMgc3VjaCwgdGhlIGNoZWNrcyBhZGRl
ZCBhYm92ZSBzaG91bGQNCj4gbm90IGJlIG5lY2Vzc2FyeS4gU29tZXRoaW5nIGxvb2tzIHdyb25n
LCBidXQgSSB3b24ndCBzcGVuZCB0aW1lIHRyeWluZyB0bw0KPiB1bmRlcnN0YW5kIHRoaXMgYmVj
YXVzZSwgYWdhaW4sIGxpbWl0aW5nIHRoZSBhY3R1YWwgdGltZW91dCB0bw0KPiBtYXhfaHdfaGVh
cnRiZWF0IGlzIGp1c3Qgd3JvbmcuDQo+IA0KPiBHdWVudGVyDQo+IA0KPiA+ICAgICAgIHNwaW5f
bG9ja19pbml0KCZ4ZGV2LT5zcGlubG9jayk7DQo+ID4gICAgICAgd2F0Y2hkb2dfc2V0X2RydmRh
dGEoeGlsaW54X3d3ZHRfd2RkLCB4ZGV2KTsNCj4gPiAgICAgICB3YXRjaGRvZ19zZXRfbm93YXlv
dXQoeGlsaW54X3d3ZHRfd2RkLCAxKTsNCg0K

