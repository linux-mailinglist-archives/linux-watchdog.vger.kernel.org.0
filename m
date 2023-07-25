Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B99761BAD
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Jul 2023 16:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjGYO3E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 Jul 2023 10:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbjGYO2q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 Jul 2023 10:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0483F1FD7
        for <linux-watchdog@vger.kernel.org>; Tue, 25 Jul 2023 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690295241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dJnF4IMbWJYrxuB99HnlouteaOo1bhGX9cG4fPovAcE=;
        b=iN7keyRwygh9+/vtxzqxfx+0zpe0YhOlqBjUBYKpqlDPiIWU4m2MdRQBrhxfFtp2N4zDa9
        FG1eb3wV6B2Y6bih4aSFLd+hZ9OQo5dhRIVolV+CgDL83zEvDV6q1PKW/rON5O/HoG3ZaG
        v/2SSgH91fkFh3guUTrUJVY+9m4oPSA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-QBZmWc5RNPqVaNgrLlx-BQ-1; Tue, 25 Jul 2023 10:27:19 -0400
X-MC-Unique: QBZmWc5RNPqVaNgrLlx-BQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fb76659d37so4895240e87.2
        for <linux-watchdog@vger.kernel.org>; Tue, 25 Jul 2023 07:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295238; x=1690900038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJnF4IMbWJYrxuB99HnlouteaOo1bhGX9cG4fPovAcE=;
        b=K2OIhw4evEEK9c+SjAju8cPPUeYjpLG2ddk7gE6dLRPmPb7vAxkw/hJvhDrZSl5V1y
         NAARk9iX5tJU0HFJoDagqj3IaY0enIMUQWhad8XMzPvwMqMHAdLdyrIc3aMmcDG7Wmx5
         LnPROcquphSALf4tCLSDSRqWwLc7SNMRBEJy/eeGV7akQMEgfUs57fBOqgYBbQajpbnq
         /jpR6ks+BqaXjtardan8sNYB4GCwxG1DPMkOoo/IDOlW5SPG7qZ/MKrBGNe58qVU/K8+
         JM51etMMMROkqZgcUug4L5bGFoNv7NpNinMTwhC4dshEOZqH4cgkD7rKOmKdtoPuwn5s
         s2IA==
X-Gm-Message-State: ABy/qLZ0jpixwtPkVEnjIee4Wl9/stcU19VD4rUKmUAlzDAfQUWBdj67
        FqtUa1lA3pJWFbx3laEaod4GC31xph5+xo5Ma9QYSjBxaEAePU1rYfOUbSfvy1F/nPfsiGITvwu
        odfThKIS0MFcQ0tvXz+dpcdGgUHM=
X-Received: by 2002:a2e:9c93:0:b0:2b4:83c3:d285 with SMTP id x19-20020a2e9c93000000b002b483c3d285mr8493742lji.38.1690295238439;
        Tue, 25 Jul 2023 07:27:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFhD9QRiReJqEWzsge7+DT1OKpTu9gEWpoa4J8ILHirJYUnLhsvhOt61gui1AJ/oAJbR+UhEw==
X-Received: by 2002:a2e:9c93:0:b0:2b4:83c3:d285 with SMTP id x19-20020a2e9c93000000b002b483c3d285mr8493718lji.38.1690295237969;
        Tue, 25 Jul 2023 07:27:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u15-20020a1709064acf00b00992025654c4sm8215701ejt.182.2023.07.25.07.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:27:16 -0700 (PDT)
Message-ID: <be72ecd8-cec1-41ec-b586-e9fb413b1458@redhat.com>
Date:   Tue, 25 Jul 2023 16:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/3] platform/x86: move simatic drivers into subdir
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henning Schild <henning.schild@siemens.com>
Cc:     Lee Jones <lee@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Mark Gross <markgross@kernel.org>,
        Tobias Schaffner <tobias.schaffner@siemens.com>
References: <20230719153518.13073-1-henning.schild@siemens.com>
 <ZLgJ7Oz1XlicGzEn@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZLgJ7Oz1XlicGzEn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 7/19/23 18:06, Andy Shevchenko wrote:
> On Wed, Jul 19, 2023 at 05:35:15PM +0200, Henning Schild wrote:
>> change since v1:
>>  - switch LED/wdt Kconfig to "default y"
>>  - remove guard which could hide whole siemens submenu, and default m
>>
>> This series does two things. It builds up a Kconfig inheritance chain
>> for all platform device drivers, namely Watchdog and LED. And then it
>> puts all Siemens Simatic IPC drivers in the platform/x86/ directory in
>> a subdirectory called "siemens".
>>
>> That is so that users have to flip less config switches, and to ease
>> maintenance.
> 
> All three good enough, although I prefer the ordering that 'tristate'
> followed by 'default' without interleaved 'depends on'. I leave it
> to Hans. Other that that,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you.

Lee, Guenter do you want me to take the entire series on top of:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-simatic-ipc (aka ib-pdx86-simatic-v6.6)

And send an updated pull-req ?

Or shall I take just 3/3 and will you take the Kconfig
changes from 1/3 resp 2/3 directly ?

Regards,

Hans



