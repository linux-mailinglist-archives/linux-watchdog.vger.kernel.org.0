Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9295D52F1CF
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 19:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238178AbiETRoT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 13:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbiETRoS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 13:44:18 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F29131F37
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 10:44:16 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id j25-20020a4ad199000000b0040e50cc687cso979642oor.9
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 10:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WyiL1ty1TX9eGoECLXqnVlWl+qyOL28rm0F3LiqWh9E=;
        b=pHF2/Hc24MEutmfdmxbkKXT9c/7rQlCwvmF78VPTZ+tjwzKtY9/RuVISJbYxHwqNsD
         Xzt3SLHKa2d5qa+OqYscZ+OTiRwFqMJAHwzZkdk+Z/waItSSH9WSnRBUrYoyeNQ/FKSd
         dcDuLuJcagcnaZdGnWMkZNnOBfiMOjFzIB4laKqjyJUH53sH4GX5OunDb9/gdLnsK3aI
         w/DAhKZZEutRq9pvpMje87d6IZ62xhcuZ3ZXBQQkoGXAWIGvfzP6BFvv5GXz4zvuFT0d
         zaBR0KkP4mbwm9sICv9SPsmZlQwmSQ1FjYWyB1TwfquY0RwXMxW9VlT+YETigLXajwRK
         AGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WyiL1ty1TX9eGoECLXqnVlWl+qyOL28rm0F3LiqWh9E=;
        b=bWUTkkM3orvHUM+ODNv90YTc4eOutY6IVMKTAl6JFnERyb2dr5jOwBFwpMs2LYyfvA
         lUSV5bukjrQ/42764OMm9hG2OPFobjfJJZeNfH2gTFp6unscTWt5ov3jAEumogV2DiD7
         bcq3R2r7SeO4SR15MbljtXhyiwLalA8n/aefrzNYateIZbp0+e0v096Vq483OsUdu35v
         sFspm1rkLacR+6xlYyOAeE9EcJ9WwrvjjI/OGYk73PkmxB9SB4IccnVkTIVfL6bPyvmr
         A9tYktk5xyUG1J4Il0xSUvoHt9Q8KUtXovAyGKOuXKVcvwvD3o9r2lXE74MMybC9oy1W
         ZMjg==
X-Gm-Message-State: AOAM531/u7umg0Ehpe3gdIvff6oBRj7oZ/ZluBk3MUR3Ja8gTv+tGp4C
        h7t5tP9wpSR/nwemQYY8OXs=
X-Google-Smtp-Source: ABdhPJxeWLwdtILwiGAbwJfS6uXJXlDG1K4sgXzkQHx+MSR6qYmkKv1ONdkB1X6MmkGPbYnZrxAYjQ==
X-Received: by 2002:a05:6820:515:b0:35f:3213:e694 with SMTP id m21-20020a056820051500b0035f3213e694mr4711826ooj.42.1653068655867;
        Fri, 20 May 2022 10:44:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y199-20020a4a45d0000000b0040e699e8d8asm643181ooa.45.2022.05.20.10.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 10:44:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <070470fb-20bb-0345-b19e-49d164f2bbcc@roeck-us.net>
Date:   Fri, 20 May 2022 10:44:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG opcode,
 H_NOOP return code
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     tzungbi@kernel.org, brking@linux.ibm.com, nathanl@linux.ibm.com,
        aik@ozlabs.ru, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com, linuxppc-dev@lists.ozlabs.org
References: <20220520172055.32220-1-cheloha@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220520172055.32220-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/20/22 10:20, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> guest control of one or more virtual watchdog timers.
> 
> Add the opcode for the H_WATCHDOG hypercall to hvcall.h.  While here,
> add a definition for H_NOOP, a possible return code for H_WATCHDOG.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>

Please provide a change log against the earlier RFC series.

Thanks,
Guenter

> ---
>   arch/powerpc/include/asm/hvcall.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index d92a20a85395..4b4f69c35b4f 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -87,6 +87,7 @@
>   #define H_P7		-60
>   #define H_P8		-61
>   #define H_P9		-62
> +#define H_NOOP		-63
>   #define H_TOO_BIG	-64
>   #define H_UNSUPPORTED	-67
>   #define H_OVERLAP	-68
> @@ -324,7 +325,8 @@
>   #define H_RPT_INVALIDATE	0x448
>   #define H_SCM_FLUSH		0x44C
>   #define H_GET_ENERGY_SCALE_INFO	0x450
> -#define MAX_HCALL_OPCODE	H_GET_ENERGY_SCALE_INFO
> +#define H_WATCHDOG		0x45C
> +#define MAX_HCALL_OPCODE	H_WATCHDOG
>   
>   /* Scope args for H_SCM_UNBIND_ALL */
>   #define H_UNBIND_SCOPE_ALL (0x1)

