Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C09B77B4A9
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Aug 2023 10:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjHNIwD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Aug 2023 04:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbjHNIvp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Aug 2023 04:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15BA10D
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692003061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a3gcnZKLEd0/sP/frTnZUie+RYs1JML9llgGix/2OeI=;
        b=EL4quM3aUN0Ae1b/YQQ/s7e8le3yVJn3CUA8ZbEdmLH5mdfoxUaDmMjX4d5VY7CuQ1td5S
        0pNCpTRtlMaXPazlNnJaFTetQ+pFsHPjYeh3MHHuBOc7hiBuyQQt1W7kAOcsFSpA4VjA4m
        NFROWoP97OblMGgoIw/rF1fKYdVr8y8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-HNcaTAnPM3-NX6zTcbGhrg-1; Mon, 14 Aug 2023 04:51:00 -0400
X-MC-Unique: HNcaTAnPM3-NX6zTcbGhrg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a35b0d4ceso250707866b.3
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Aug 2023 01:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692003059; x=1692607859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3gcnZKLEd0/sP/frTnZUie+RYs1JML9llgGix/2OeI=;
        b=gjX85psvXd8iy4YgPVbHBIuKiEEO8N2M/w6bLULJzV9gI1ycuKqi6C0ao0gthNB7OY
         yxzJH04dVxdUOwk2kYCde6Byg17P8fms/f8TkzSedvoVdJMtLCNyx3WZLcv9UPVa5w8Y
         5GlSs1hTqkbWm0pDnyxYzXeDKRxElYlwx0soKidbRoZtgoPegyQAcQrJvMvqH5dhgjnj
         qqv8uxT6W8ZOCcT68dSy+bIi7wmErO34sPxnZJW718Cie2i8OMEP+7NRTAWW12sHneva
         SEu3P/RJ/DdTDkPhuPp/G6pu7XO0wLjVvvT0SXZ/4IizSBYYJJt7Crm0pl1kXUBuR312
         oGFQ==
X-Gm-Message-State: AOJu0YyzjBTt+fZvKMLIL5Sqw+Gl/oWEMRDR4jAuSwrdbEzr6UKzY/AE
        hXQqM44k3QQxq5DRSbJOElZ0W4F3bkqv4j/EE8MI36D/2dkZqPTt0z81sNPLq8PtDtlZky/qdZU
        uAR4a8AoJFr0VPkz+12FronRO4mY=
X-Received: by 2002:a17:906:1daa:b0:988:a986:b11c with SMTP id u10-20020a1709061daa00b00988a986b11cmr6559171ejh.29.1692003059413;
        Mon, 14 Aug 2023 01:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETTCjSXNj0S0mhYm5hz+lr/D6808KX57i2K5b+YUbNVOxibyLYE1n7UQOJHnQKm4MQyNw7Rg==
X-Received: by 2002:a17:906:1daa:b0:988:a986:b11c with SMTP id u10-20020a1709061daa00b00988a986b11cmr6559162ejh.29.1692003059152;
        Mon, 14 Aug 2023 01:50:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b00993a37aebc5sm5399887ejb.50.2023.08.14.01.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:50:58 -0700 (PDT)
Message-ID: <672725bc-6ebf-0a35-96ab-8862be7de193@redhat.com>
Date:   Mon, 14 Aug 2023 10:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] watchdog: simatic: add PCI dependency
Content-Language: en-US, nl
To:     Arnd Bergmann <arnd@arndb.de>, "xingtong.wu" <xingtong_wu@163.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Haeussler, Gerd" <gerd.haeussler.ext@siemens.com>,
        "Schaffner, Tobias" <tobias.schaffner@siemens.com>,
        "xingtong.wu" <XingTong.Wu@siemens.com>
References: <20230814073924.1066390-1-arnd@kernel.org>
 <a6c2f193-ef7c-54a0-dfbb-13915be259a1@163.com>
 <1834eee9-3fbd-4bea-9e22-960ca993303c@app.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1834eee9-3fbd-4bea-9e22-960ca993303c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 8/14/23 10:48, Arnd Bergmann wrote:
> On Mon, Aug 14, 2023, at 10:27, xingtong.wu wrote:
> 
>>>  
>>>  config SIEMENS_SIMATIC_IPC_WDT
>>>  	tristate "Siemens Simatic IPC Watchdog"
>>> -	depends on SIEMENS_SIMATIC_IPC
>>> +	depends on SIEMENS_SIMATIC_IPC && PCI
>>
>> The SIEMENS_SIMATIC_IPC_WDT does not depends on PCI directly,
>> it should depends on P2SB, then P2SB depends on PCI
>>
>>>  	default y
>>>  	select WATCHDOG_CORE
>>>  	select P2SB
>>
>> You can replace the "select" to "depends on" instead.
> 
> That would also work, but it's generally best not to mix
> 'depends on' and 'select' for the same symbol. Changing
> all three 'select P2SB' to 'depends on P2SB', or removing
> the prompt to turn P2SB itself into a hidden symbol is
> probably a good follow-up patch, but I'd keep that separate
> from the regression fix.

Right P2SB would benefit from being changed into a hidden
symbol.

Andy, any comments on making P2SB a hidden symbol ?

Regards,

Hans


> 
>      Arnd
> 

