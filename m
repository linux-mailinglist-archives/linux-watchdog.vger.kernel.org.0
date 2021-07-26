Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FADD3D5918
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 14:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbhGZLXC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 07:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32827 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233762AbhGZLXC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 07:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627301010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=46YjFiGSOu3vFvPZA/rXtYR2f/Xj94q6y2DUkIi17h8=;
        b=glpdzUKXd+uyvhn9T9tQGHNrrsKHlPqRSRXrLFWnyNCj39pjlGuRrZVBN/G4wZbCF9FN7J
        1BDUB9swA+fG1A8UrftgusAK8R+Gnxl2DAcEHhTRnbBvFSc5Orzw687H+Uv2fzGZeehbQb
        Sz+o5lGon7GC3JTM+AJMF9gsVNMYrgg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-gL66kBsSPwOHNlMsASU7RQ-1; Mon, 26 Jul 2021 08:03:28 -0400
X-MC-Unique: gL66kBsSPwOHNlMsASU7RQ-1
Received: by mail-ed1-f70.google.com with SMTP id s8-20020a0564020148b02903948b71f25cso4620541edu.4
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jul 2021 05:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=46YjFiGSOu3vFvPZA/rXtYR2f/Xj94q6y2DUkIi17h8=;
        b=hLSQnTxapRbXX2MNTkVxdHgALHUv71/CymZTeD3ue6jupW/OplpDhDuKStXKPlI27/
         bubyMbOAoeQHPiHh3XcGiuVL/ZMheArCO8fIdJR1PI5yWquSOScXdOicpJXSrMcty66I
         APOqi71DZxc4eAu/eZXm9PKpWHy2DXuYc9YXpj9JIEmW0AcX47XhPz7RVH5e+IKJErC9
         XNxi2kplIOeOs2mY0IfmcXfaD9qgIw4FdXCoiWTjhv40BWBXx5A96RliDsEQwdJ5YehN
         YDqladssK3YqMHEXMi02BpYYV2EdWKokMzk6W+Qg4+AiehLSeLNf2/IzoPGJ5wxQHQGz
         02Kw==
X-Gm-Message-State: AOAM531xUGnt9uaDk4PpMmhobUGAkB0xTQGkWRzSto3GeuCggxZ8Sq6G
        X5tKvqrVb6dEeLNcTGlD8F/uapmgyfg+OJ23cp03oDplpNj2dtmDAyGlh0UQu++Y4DkcePMwP2z
        72cD/mU/ghivz3ZSRaRy1kAupQJg=
X-Received: by 2002:a17:906:3b47:: with SMTP id h7mr9619103ejf.399.1627301007738;
        Mon, 26 Jul 2021 05:03:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFUlWlMBtOeCXgz63WJ0nRRQfYhSLqdqCRtMJX2iTA/Lw19OEJxkslezgUdDRT+k//1SW2pA==
X-Received: by 2002:a17:906:3b47:: with SMTP id h7mr9619081ejf.399.1627301007481;
        Mon, 26 Jul 2021 05:03:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id e27sm3803750ejc.41.2021.07.26.05.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 05:03:26 -0700 (PDT)
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>,
        stable <stable@vger.kernel.org>
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b3b75b72-33d4-ce21-a8f4-77a37156aa9e@redhat.com>
Date:   Mon, 26 Jul 2021 14:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26/07/21 13:46, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Obviously, the test needs to run against the register content, not its
> address.
> 
> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
> Reported-by: Mantas Mikulėnas <grawity@gmail.com>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>   drivers/watchdog/iTCO_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index b3f604669e2c..643c6c2d0b72 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>   	 * Otherwise, the BIOS generally reboots when the SMI triggers.
>   	 */
>   	if (p->smi_res &&
> -	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
> +	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>   		tmrval /= 2;
>   
>   	/* from the specs: */
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: stable@vger.kernel.org

(the latter because cb011044e34c has been picked up by stable kernels 
already).

Paolo

