Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C58C77B441
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Aug 2023 10:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbjHNIfU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Aug 2023 04:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbjHNIfI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Aug 2023 04:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E01127
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692002063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BlUWJ2CnLxkuvPDb9XZkWsErKpnwhZXyja4MQxZ4sYU=;
        b=JirKrxZhV+javmp8K1llpmJmuev85osvk1xGICvI7mFE2fCQL3/AYM05xPlUjNIoLEezCb
        N6KpebQOQOBueWPg/RCr4TuTqRjULrWGCFZ6le2gsF2XjSXbb0LjsPYmga3DrZYV796zyO
        llSk38DPot3escuG3ihiW0qGCk7xPgw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-BJgc3TvdPfagUstIZRkE0Q-1; Mon, 14 Aug 2023 04:34:22 -0400
X-MC-Unique: BJgc3TvdPfagUstIZRkE0Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-98e40d91fdfso243574866b.3
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002061; x=1692606861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlUWJ2CnLxkuvPDb9XZkWsErKpnwhZXyja4MQxZ4sYU=;
        b=a37+uU3s2z3KuS0ZFtvWUILe/btvEFJtqKbROHz3NeRuY9dXjGY6+ZPpjX6loSxB1D
         ZIymrHFZFVnBptJtozG8eVsSGUHY79oJh3Bd3Zesm3IIQVarhhXchnyy5puggPu8xl3y
         xTJPL77lAhmHTvZp0NMBeKm5P0eesMeOol09RZCm2wXltNgfTGD8PeOa/XB4JtwmXpXc
         rLtVq3p+xdc2JFviWjnW5OTxSW03/fD3xtWPBxdFem1RLylTzs1AljrrJr5/YSDwxTDA
         q9VBX/r7QSQNsOb/yPtn9QeVnVX9KpZZyPJfbo29TnjvW5unaCzAyrBcyQ9WE4tPKjbM
         B9fQ==
X-Gm-Message-State: AOJu0YwchbOfZo1HCLVAcDO4RvkQ03dMMu9YJYOqbF78Ivp1rW1cY2U0
        lmwuM017ctxXhXSDcIMlGc3Ae6sc4Er5Efrc6vWILrBbCWEPCUdly8CPb9tTorBgg1YvGtc9CrZ
        3lUm+Ig681VGyn0nCw/ASfBly6c0=
X-Received: by 2002:a17:906:5c:b0:99c:f966:9e9f with SMTP id 28-20020a170906005c00b0099cf9669e9fmr7220363ejg.64.1692002061241;
        Mon, 14 Aug 2023 01:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlP2EFgeDt+NObU1PsrWMBNiq2nhwc54zWFCRnWTW8QfnjY0LAKVYftBpDthUIT5OBy5UPCw==
X-Received: by 2002:a17:906:5c:b0:99c:f966:9e9f with SMTP id 28-20020a170906005c00b0099cf9669e9fmr7220351ejg.64.1692002060919;
        Mon, 14 Aug 2023 01:34:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a9-20020a170906190900b00992c92af6easm5419065eje.161.2023.08.14.01.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:34:20 -0700 (PDT)
Message-ID: <1da50566-4a23-7fe4-16d2-1064f2e18a2d@redhat.com>
Date:   Mon, 14 Aug 2023 10:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] watchdog: simatic: add PCI dependency
Content-Language: en-US, nl
To:     Arnd Bergmann <arnd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Henning Schild <henning.schild@siemens.com>
Cc:     "xingtong . wu" <xingtong_wu@163.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230814073924.1066390-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230814073924.1066390-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 8/14/23 09:38, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The simatic-ipc driver no longer depends on PCI, but its watchdog portion
> still needs it, otherwise P2SB runs into a build  failure:
> 
> WARNING: unmet direct dependencies detected for P2SB
>   Depends on [n]: PCI [=n] && X86 [=y]
>   Selected by [m]:
>   - SIEMENS_SIMATIC_IPC_WDT [=m] && WATCHDOG [=y] && SIEMENS_SIMATIC_IPC [=y]
> 
> drivers/platform/x86/p2sb.c:121:3: error: call to undeclared function 'pci_bus_write_config_dword'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                 pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
> 
> Add back the minimum dependendency to make it build in random configurations
> again.
> 
> Fixes: b72da71ce24b0 ("platform/x86: simatic-ipc: drop PCI runtime depends and header")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 04e9b40cf7d53..09452384221a4 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1680,7 +1680,7 @@ config NIC7018_WDT
>  
>  config SIEMENS_SIMATIC_IPC_WDT
>  	tristate "Siemens Simatic IPC Watchdog"
> -	depends on SIEMENS_SIMATIC_IPC
> +	depends on SIEMENS_SIMATIC_IPC && PCI
>  	default y
>  	select WATCHDOG_CORE
>  	select P2SB

