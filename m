Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8F037F410
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 10:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhEMIb5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 May 2021 04:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbhEMIbz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 May 2021 04:31:55 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0CEC061574
        for <linux-watchdog@vger.kernel.org>; Thu, 13 May 2021 01:30:46 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id n184so24653285oia.12
        for <linux-watchdog@vger.kernel.org>; Thu, 13 May 2021 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4v3uOSJzLvuD6GyLMpfxuFxbsMLJ/tVBji1ouO+e9yI=;
        b=gyfZM26/d1k4jOqLAT0I/tlMIsnVJx5zXzkEH546d5+ncIBDT8L6mxIiDt3Br+LPR1
         sz6EtsqYuSwl24n+vFk8NZv6iyNjyaHt0xvLRCuLmutOAKRgjX7yqnWPeKYy8iQZ1r5/
         A3YJbF0lsRZQf3oBQb5c9KcHUlnpZrH0oZcuT+IyyXWK0va8KY1hKBcpCt3ubNEABs+T
         jNPHib55ylAj2QIpolJFUaNMLkGxZ/E6OTwvW2/edVQLj3A/w7JCOKMJwO8r+udXrDX/
         KUfUG9sw3Atz0zbu5a2lA9e/iOV3XY5AJIFblOhWMfJJwk8r8Iq/zJzVdcUCZUsM3dv5
         Px+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4v3uOSJzLvuD6GyLMpfxuFxbsMLJ/tVBji1ouO+e9yI=;
        b=sYxS6YIIDQknHaoIxlRnWMrJ/zpPx0vghsMUSdK52vslX+ok3lGaalHaTkbyWKMhiY
         5VSrZFjgAdtP4dbZOa/gs+4y0/x8bsTYuqXwvBM6zJsegBS6wUwpz+GWrA+jQ/leYkYp
         eo8V6GxTMM3rjwTdtfvr7cLu3hGLDk5Ioc++aNzXYuSQ1fYjPgVtXzrzGAIi2wrSEHG2
         23ywwQDzU16g4yRN19yUrFqThozyN06VQWMFT5gLfnHkGahxoKWyCMhtfCj//sEYFExX
         4zNCCvmZso8mOezMVZRaRwZnuBCreC/68AdxTenBL0dYRWMaGiIlxzmztQB8VWhP5Jcr
         BwYw==
X-Gm-Message-State: AOAM5311nsqc8qr1z/w8/Jc1PEsBws9nMisjxQC5IHhBaoBoLHq/p4Qe
        b5dQfJikKeeCXFs7WX1bHLATqCYyEhY=
X-Google-Smtp-Source: ABdhPJzZqy2rhH/0AjRQcteZkG7RleUa1QZ4PS55w8fiOfSfffbBUJ5R8efvGU2TtmM1ZsNEwqXctQ==
X-Received: by 2002:a05:6808:1448:: with SMTP id x8mr4633749oiv.148.1620894645187;
        Thu, 13 May 2021 01:30:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a14sm509059otl.52.2021.05.13.01.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 01:30:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V2] watchdog/hpwdt: New PCI IDs
To:     Jerry Hoemann <jerry.hoemann@hpe.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <1620878612-24736-1-git-send-email-jerry.hoemann@hpe.com>
 <1620878612-24736-2-git-send-email-jerry.hoemann@hpe.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <85034e91-432c-4fe7-ec35-67281d9bfe22@roeck-us.net>
Date:   Thu, 13 May 2021 01:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1620878612-24736-2-git-send-email-jerry.hoemann@hpe.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/12/21 9:03 PM, Jerry Hoemann wrote:
> New hardware with new PCI ID info.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/hpwdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index 22ddba3..a5006a5 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -45,6 +45,7 @@
>   static const struct pci_device_id hpwdt_devices[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_COMPAQ, 0xB203) },	/* iLO2 */
>   	{ PCI_DEVICE(PCI_VENDOR_ID_HP, 0x3306) },	/* iLO3 */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HP_3PAR, 0x0389) },	/* PCtrl */
>   	{0},			/* terminate list */
>   };
>   MODULE_DEVICE_TABLE(pci, hpwdt_devices);
> 

