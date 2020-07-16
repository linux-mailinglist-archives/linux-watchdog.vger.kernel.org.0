Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF032221AE
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jul 2020 13:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGPLsa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jul 2020 07:48:30 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com ([40.107.8.111]:18849
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726383AbgGPLsa (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jul 2020 07:48:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+clnLwkRjWC4CZaGP/c/dTqs/y+2EDNt6AV+RBWn51mylfDfQ+B+uxkm6TVdrrG5fULjzX3kjOjb0x5jHq6QwQ43QvM6259wz6rkjZdNic1VYRpCSXin+bttijaALFu0pQ9Co46CqF9xNG8blysaXO5aoeFcAQIXnj9c0eJo4/Il+eT3QoxEo9boS25Atihj8u84LGehBpLWrhnyvZVEAIKcRcbYam/PwqVDLDIOT3e7wCnib3GYICwJszUiuDDoYgmTq+H69/7b+/XlIfI8XWASsFYneuOJ+gHde5EiIrudv7MuzA8mtYlzHQowa1qHhC+hEhHaKr5yXL/+tIbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDCg2U7WjBCGnGcEJCje6EsdODe6/yJ5AEwPzJHCyKY=;
 b=XBmHGZci2rWb3yovqUFbPdjuHwgEXWV9amJprzMyiLpZw69vjWdfpqweIyujwY0Hnp46ze5Hez68/gRQoFNfcRClcC/CgNtfPB+JR0KHHYUtcFiHr2Iv1ZpJef35IFd5JG9mFfpn/CRmF1tWTFE0iDMS73bk82UYQllqppxEqwHps9CnebFHBB/kDTfPvWj+8L0wRH+GHxrpSIE29np2Bjv7h4+OkMePOyls+W5QoLkgOx4i2K3pn0kMks+eN2uI2PaBGFlcg5wWHkySjfCaQuS9P76+9Q5gBwQfOPEXTLoVITyUa/TFMcUZg5BrD+n7y8GukVATuiYoGFm+mezokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDCg2U7WjBCGnGcEJCje6EsdODe6/yJ5AEwPzJHCyKY=;
 b=fdulaIyKlEZrY3ejveKbeEiXa1gnSw65kDZ1lCiITqAoVxJtbolUjIj6AbgKru1r4oP33YrcygU/c4lrJvq0aaBuEtwIa/99lzVWAa+2i/pkWHQniSw+nlAT03Wc1wGHKr56w0jjGTq5xP5g4IqzkXguachepTUhdXTGV1OAYtU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from HE1PR07MB4412.eurprd07.prod.outlook.com (2603:10a6:7:96::13) by
 HE1PR0701MB2764.eurprd07.prod.outlook.com (2603:10a6:3:91::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.9; Thu, 16 Jul 2020 11:48:27 +0000
Received: from HE1PR07MB4412.eurprd07.prod.outlook.com
 ([fe80::7071:9f4d:b39a:823e]) by HE1PR07MB4412.eurprd07.prod.outlook.com
 ([fe80::7071:9f4d:b39a:823e%6]) with mapi id 15.20.3195.016; Thu, 16 Jul 2020
 11:48:27 +0000
Subject: Re: [PATCH v3] watchdog: initialize device before misc_register
To:     "krzysztof.sobota@nokia.com" <krzysztof.sobota@nokia.com>,
        Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ab5739d7-3542-08d0-402d-65aeb14b78ab@nokia.com>
 <a9338b3b-92d8-08b9-2f4e-59abceb1b307@roeck-us.net>
 <55fa2e05-9a99-b205-2dad-b797786af22a@nokia.com>
 <1f20e45d-aba5-6226-27f2-cb6438cc224e@nokia.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <e2b9f886-5a4e-91f3-59d1-c83a46149a82@nokia.com>
Date:   Thu, 16 Jul 2020 13:48:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1f20e45d-aba5-6226-27f2-cb6438cc224e@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0077.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::17)
 To HE1PR07MB4412.eurprd07.prod.outlook.com (2603:10a6:7:96::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by MA1PR01CA0077.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 11:48:23 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e00a56e2-ad29-40e7-1f78-08d8297e26d0
X-MS-TrafficTypeDiagnostic: HE1PR0701MB2764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0701MB276435C17CB3D1C8C3A946B5887F0@HE1PR0701MB2764.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBxIVTUakR8hTO8ZUy97Z8R6/MgPeFTMfMVLhCoJwg7SBPWL3tULpmfQkIXL9RTPMapTmju6IUUlri7F+FI3lFHa2mi0smN7xZtklNU4c3TjElQmzsTu3evAX61gQKj5JVExYAyigYwDClDBj/86NXoEdFDa00BApP1If03jNFWjHYKFjwyJemmFWi6guN8jN/Wr7mfhlmL2XCfGg5VsUQykO04LIE1X/QE6X7qaPm7dZkfgLYoHanGsdjhckHnWeRnp0klsOMxOSar4TkvK2O0c/vE5v3lHHsaCkNTZvfetzx7AHqfRTf4Awe63IhtKGlUbUxCmbLhWj8YJlHK3SFKFNJ0VEKxBQUyaPk0BnATrsStEgldcJNPVtTQBsm+p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR07MB4412.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(8936002)(956004)(2616005)(110136005)(83380400001)(44832011)(66946007)(66556008)(66476007)(16526019)(186003)(6486002)(6666004)(31696002)(52116002)(478600001)(53546011)(8676002)(86362001)(31686004)(26005)(5660300002)(6506007)(6512007)(36756003)(2906002)(316002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: Yu/t/XkmvEYRMaOyOahw83veoMM6mX/QtS6HbuYaTQ2/rTb2INFSZjVcDSjmPDgjpUtddSX5nm+SI/XtO9K55BGiIsH6rxmJvz9tX7GCOU3vqApeDHkUH9UJXdJhK7ZPfN8ulUFGY8U0K9DI2aaEUYtLoVlVrPXUsWBqmYOQMmM5dCZt6enE4NgemAeZeA5Ipwf+RF5lmJK7JkUHVwpDKYMxRb9koXQ9qR4N9oKm1ITGuJI/93VVDAQohTYClcSNbNaQWqP00EgcKEmLJ/TPc0ysiLMYwed0wvW/FunVwudyIWRr+RFN3eJpgdM6isMASeSdHgAy5JATvatrR82Vx1lEdV2+xQoyCSuT89TLhMiiSOWmH5T2XxzB+w0sQYZ8jwliE57yBzmD38EBYwC/4r1sHJyvWEaO8QZiGipklH+m0rDAQEx95eg5k1ndO1dwrEpwryd+jnxL+8vLgqA6LfYKw6nUDUZbHuePGGw4KTVUzlAz4u4DvOrCEt2Iib2a
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00a56e2-ad29-40e7-1f78-08d8297e26d0
X-MS-Exchange-CrossTenant-AuthSource: HE1PR07MB4412.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 11:48:27.1494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hAtsjWb5UjwLCYkUadrlU5zHnYXcsKU2pSVKZQ2IT6JODJy9wCydYfP/kZSibeTkNI53qyOHJKDrbwJKi+w1mpMhp4dCAv3PfUqGLHRQf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0701MB2764
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Krzysztof,

On 16/07/2020 13:32, krzysztof.sobota@nokia.com wrote:
> When watchdog device is being registered, it calls misc_register that
> makes watchdog available for systemd to open. This is a data race
> scenario, because when device is open it may still have device struct
> not initialized - this in turn causes a crash. This patch moves
> device initialization before misc_register call and it solves the
> problem printed below.

[...]

thank you for looking into this!

> Fixes: 72139dfa2464 ("watchdog: Fix the race between the release of watchdog_core_data and cdev")
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> Signed-off-by: Krzysztof Sobota <krzysztof.sobota@nokia.com>
> ---
> v1 -> v2:
> * removed Change-Id tag
> * added Review-by tag
> v2 -> v3
> * convert spaces to tabs
> * convert (hopefully) mail to plaintext
> ---
>  drivers/watchdog/watchdog_dev.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 10b2090f3e5e..1c322caecf7f 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -947,6 +947,15 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
> 	if (IS_ERR_OR_NULL(watchdog_kworker))
> 		return -ENODEV;
> 
> +	device_initialize(&wd_data->dev);
> +	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> +	wd_data->dev.class = &watchdog_class;
> +	wd_data->dev.parent = wdd->parent;
> +	wd_data->dev.groups = wdd->groups;
> +	wd_data->dev.release = watchdog_core_data_release;
> +	dev_set_drvdata(&wd_data->dev, wdd);
> +	dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
> +
> 	kthread_init_work(&wd_data->work, watchdog_ping_work);
> 	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> 	wd_data->timer.function = watchdog_timer_expired;
> @@ -967,15 +976,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
> 		}
> 	}
> 
> -	device_initialize(&wd_data->dev);
> -	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> -	wd_data->dev.class = &watchdog_class;
> -	wd_data->dev.parent = wdd->parent;
> -	wd_data->dev.groups = wdd->groups;
> -	wd_data->dev.release = watchdog_core_data_release;
> -	dev_set_drvdata(&wd_data->dev, wdd);
> -	dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
> -
> 	/* Fill in the data structures */
> 	cdev_init(&wd_data->cdev, &watchdog_fops);
> 
> --
> 2.14.0
> 

-- 
Best regards,
Alexander Sverdlin.
