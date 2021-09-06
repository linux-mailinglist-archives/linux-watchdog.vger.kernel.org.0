Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92319401AEE
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Sep 2021 14:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241674AbhIFMGu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Sep 2021 08:06:50 -0400
Received: from mail-bn8nam12on2078.outbound.protection.outlook.com ([40.107.237.78]:49554
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241611AbhIFMGt (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Sep 2021 08:06:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ij96EfI12NKXNJjSdcY6mSTvq4k1mtkyu9BY+iS3GbdBH9c2QN/zzqSRu5yQb44+MdvN4jsjcJvUKHZ+HRBhs/f0UqM5o9Pwn8CazvM0GWqMyJlc+rfRDURydGL9ZoJ7+bLeKonzQYR4kU82CQVocT9PUBFFYcdYyC2B58Dsk/sS3neDbLeceAW6Oz0rKybpCGgMwdMgFiKTP2+mgbCrXS2ZOxmmLCiRaBagGRIUEIahGso0kq1OqqsMnpopV5XDGuvOkIU4dvc9wzG7Vp0QO51wP+bZOqcvPymRLP24JgJep1jqVgHpzvE+Ul8+7EV6hSMoYv0hEvB4cJJFToSqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=E0sLbT4Kdg5B2o28LSn4tQluik3lL7SWcwJZBSnwT+A=;
 b=D9o6rKnOa1qy9VcWsLiSToJNJV0GCTMJRFO1vRH8FOxndXD5/OUJhTOCXnuoumAHxTQdSyI/tAvXs1/QIUpxakZxLdzSCIl74uyvMml0hYgjsmRJ4LTkIFMNkR6JReomwkOjR9hHrMJtmMnq61zXIAFiUGinnfrJczM1sfq+x9vGfBXoxQM0hhJ3g976Zq+FCBwU3E43y6G8D2KppVQDHew/y/Iin8eYb1VSiwbnPRc9SYhaL2fQzrqX51O01yN01RrjddBV9emyCOF58bmHF1EA1cEj9yw38Gg1MomNoQWsOe29Ra0CYZiEN99hYpOm64r1O0XeoITJU07W3apcwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0sLbT4Kdg5B2o28LSn4tQluik3lL7SWcwJZBSnwT+A=;
 b=qphSIE1qIVQ2bRU2nzgj5twMQX5JBrpnQE6ag1urIf2fGxnHrfyrxPUGayzvUuxxpvU16mIk/F8MXQd7VYXnySet/2PgztrDvLO8uh6EhjHR2lDt0o0W77yHdxaZamCvWxdOSh+x0GtSxcMll4Ctc6QdkPRaD1nRYzQ6rqOluSY=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3657.namprd12.prod.outlook.com (10.255.76.18) by
 DM5PR12MB1628.namprd12.prod.outlook.com (10.172.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Mon, 6 Sep 2021 12:05:42 +0000
Received: from DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::909e:4d3a:7c48:a0d6]) by DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::909e:4d3a:7c48:a0d6%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 12:05:42 +0000
Date:   Mon, 6 Sep 2021 14:05:34 +0200
From:   Robert Richter <rrichter@amd.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Terry Bowman <Terry.Bowman@amd.com>,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Watchdog: sp5100_tco: Replace watchdog cd6h/cd7h port
 I/O accesses with MMIO accesses
Message-ID: <YTYEDvTTrE5JXlk4@rric.localdomain>
References: <20210813213216.54780-1-Terry.Bowman@amd.com>
 <416a67a7-646b-eb8d-b617-80cbbbc028c6@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <416a67a7-646b-eb8d-b617-80cbbbc028c6@roeck-us.net>
X-ClientProxiedBy: BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::18) To DM6PR12MB3657.namprd12.prod.outlook.com
 (2603:10b6:5:149::18)
MIME-Version: 1.0
Received: from rric.localdomain (77.183.108.107) by BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:14::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend Transport; Mon, 6 Sep 2021 12:05:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd271f7b-e6c5-4805-b6f3-08d9712ea62b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1628:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB162831D690683299D4F1508B9CD29@DM5PR12MB1628.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mlpfoXJFxJswYOiU7uIpx0AYj3VV/+K8z9ZcpF2DJnO4RErntS0ri6Tl001PAkyQybelQCgohbb/gTjtLd0uFGNDuMCRj87HpO6b4WClOq8q97nzMNGv+UUREKounc22V8csS+4ywkzNBll1E/O1IRck28XQK5Ab0fMTKAXgtqefmaa5dX+/H7M7gvas+WKTexbQyh22+RKg0e0MtuzFkuNSzBM65vqqhv3Dl1Y9QmmSbyixIxDHVvJ87HJbdQBpGlehglVROdlLc6qHfZNbID2eERsECo0b30vehip9MpRr5EBnuEUAorjpnztPDtOs3xnEjcQW5WdGcSqL10gkYy5H5zrvGWkTrfOpv2C64XEnOz1rt6SsQTjgwncA6VmcZwnt2TKPkhj9qoDMPcdOSrg3mCGc15HxWaOuBy9tk23KvwW+FPZOS9mURZz4Pb0ZvBuk+mjRQhMBVNnD/Pk/4atFxEjix8UfmJoh8ckXP55VdjDYIpUPaBCikUwJq6bwIhyx9vohdIr4J1SRJPakzDGBxF669/1OuFgjhW/wcRN2XxLYE5bhXCWqoIc9+XK8TU4alTE65aSpdajEDjNEHbF9y8xc88gSietmsL/nFEfCmipf+MSBK1+PH5XdDp6zMCUV6x64dLDq1NQhXsfJBAFtpRLys82vxYxlArj6BqY4bWQ534ovTK1dfM3e7A64US1fXzpQ1SFQeKGMvexSk7hpEyBAgjYfuuTkEjbvKmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3657.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(7696005)(55016002)(5660300002)(52116002)(6666004)(53546011)(6506007)(66946007)(38100700002)(186003)(9686003)(316002)(2906002)(4326008)(478600001)(38350700002)(8676002)(8936002)(26005)(956004)(6916009)(66476007)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ruli8hpGtbQAmS7F4fNncDnTM+GiT5+0pzV73MITZx3noZVNJyv8C/vS2iL?=
 =?us-ascii?Q?ko8V7JyfQ/KfyZ0EYScLnglf1fVdvkLEzrAU8SBU0uBNMZMsQ8/aTFrXddLk?=
 =?us-ascii?Q?/7KbzcajZSsWw1j2fUPWqxOflX3uD12sMZN/lo5B4OUlrFp1dEoUk5Z7+r1A?=
 =?us-ascii?Q?y9VKNeAj0XcFiffLGzZusv1LshMRhXbJdsLYCC9eiPVsMe5a11QnQ0xVzFSz?=
 =?us-ascii?Q?ytmi+PD55KdPTkv+llAquIZmiTbnALS8xSxFODepyPDncWNBKFTSzV/I60cq?=
 =?us-ascii?Q?c2+kC0AJjA214Vk4PifXxxgnw4uTR5sRj4V3MiTAu060BEcte/7orYfnMj+B?=
 =?us-ascii?Q?8ICmYI1+EmQpDW1y6lD1ejurYcmlP8EbWVB1miUXyjwmGvHMbQkhw+6CCR7X?=
 =?us-ascii?Q?/lPtGwybA692pzARWZess5Z3Bye+uQed6mDu7fi93eS8E49N1zrmvneH+CLD?=
 =?us-ascii?Q?CFgyZiXs5pmm0vrSl5y/8rpp/HFxnXVpc8mv9pFquGEQEpb7SIDNGTXvD+9q?=
 =?us-ascii?Q?I/vHHb69tZDSDRjSsWl/h623iQr4Y9KrtXDyZwvIujzz5uwP9zwkaXDg7fC1?=
 =?us-ascii?Q?woCJBN3BBCpXofaXyUiAqj5H88cuIL5md8liD5G6priIjbzzyitzl+tpQgcq?=
 =?us-ascii?Q?bn78brDzyobSp0m5Hia32zClboS4ZAvMXzBCcN5V17c9r/n8X3H0upvbRAdW?=
 =?us-ascii?Q?KY3MSD0ZDcd56mkuab1kA7N9cPQZRdhtiyMaULfo8qCYQ/dMKTYPCVeLQHP5?=
 =?us-ascii?Q?k7WJ0dgNmIWuFIMEEbmXdfLW4tAs5vGNR1MmKmel/PSxAQ/ZX+T1tqjvzAtT?=
 =?us-ascii?Q?sIPTZEjxwOjaTkd0rs2dQ5kFq8IfFmtXqCakQVyfneXyUT+TlDsU/RfFxBNV?=
 =?us-ascii?Q?91mClk7ost6fCUzZjmrMVmwr8Oscn4X/YWg4H2S8+Vf/SPX1oshsLynXN8zb?=
 =?us-ascii?Q?nB8Z55fj4XDGdhs2+oBJFsLT1PXtivD0I/onJY/cCoRe1wwJgF3tbDxbynui?=
 =?us-ascii?Q?9JMfA6Yd5J1p6nRSsdxiZD+4mBuoELQLe4YX6/VJsch+IRikLaWb0g+VWU1O?=
 =?us-ascii?Q?y1uQq4YpB5Wlxb54DTQZPr3uXKUHWaueXN3YuK2ZhlfsshM9q173gVPJNjQi?=
 =?us-ascii?Q?Jb69XF8ZYTMIhS4NQy8tAXnxhAyQrXdH3eJlfuYvg7tl+t/94PqSoE4XJOHa?=
 =?us-ascii?Q?zmj29Pi841qZgz57In0PARwao4EBfbpzhOzS15PVgQNLi+J40nzYb5UR961e?=
 =?us-ascii?Q?yU6dbhdRASGpIEowLfkBd5fVKr+J6xbKBFj30DlQjHoAXiee5IH3qWXqs9b4?=
 =?us-ascii?Q?1Gk+6ASHmV2JMM6zMNJhW2Sw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd271f7b-e6c5-4805-b6f3-08d9712ea62b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3657.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 12:05:42.1921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ape4yhYMxV7RTrWRZbBmVnuDH9TQhwO8yqwWIDGUHaxY6gOq2iWpaodPtX2ruXz+fCREqwjbFMz7IZvpey2joA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Guenter,

On 13.08.21 15:37:30, Guenter Roeck wrote:
> I am sorry, I don't understand why the new code can not use devm functions,

devm was not chosen here as the iomem is only used during
initialization. The resource is released at the end of it. Using devm
would keep it open and carry it around including its data until the
device is released which we wanted to avoid. This would also add
unnecessary data to struct sp5100_tco and/or the device's data.

> why the new data structure is necessary in the first place,

Instead we used struct efch_cfg to carry all that temporary data
required during initialization. This is destroyed at the end of
sp5100_tco_setupdevice().

> and why it is
> not possible to improve alignment with the existing code.

The driver serves 3 to 4 platforms now. To refactor it a core driver
is needed plus sub-drivers for each platform. We decided not to change
existing code here for older platforms and keep it as it is for them.

Moreover, the efch driver only needs changes to its initialization
code (using mmio instead of ioports), everything else remains the
same.

> This will require
> a substantial amount of time to review to ensure that the changes are not
> excessive (at first glance it for sure looks like that to me).

This patch implements mostly helper functions and adds alternative
code paths for the mmio case. For an easier review we could split the
patch in about 3-4 patches, would that help?

Thanks,

-Robert
