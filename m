Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3464947A1E3
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Dec 2021 20:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhLSTM3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 Dec 2021 14:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37624 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236375AbhLSTM2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 Dec 2021 14:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639941147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T8/CKRt5V9U7nLZxUPB/0vDh309BnirL+Ug111TDiQk=;
        b=KQbjjnmp4C/f3mWH/1QoAaSfskJZlkgBTgd142CcDfjdLgV4n8aUDqNzWdtLJJAmIgjWoi
        ghLMEKuts2FGjd3lyyaKPodzUMtrmZWGdXCErWQW6zmnjpMzRQQNRouw4JrAjOUE4yiFr9
        Dn6CE9BFDHgL2pNT7nKQULxA9zvVePM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-nSsBcw3UMtCb9J5hVitZIQ-1; Sun, 19 Dec 2021 14:12:26 -0500
X-MC-Unique: nSsBcw3UMtCb9J5hVitZIQ-1
Received: by mail-ed1-f71.google.com with SMTP id z3-20020a05640235c300b003f829cc299cso2891344edc.0
        for <linux-watchdog@vger.kernel.org>; Sun, 19 Dec 2021 11:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T8/CKRt5V9U7nLZxUPB/0vDh309BnirL+Ug111TDiQk=;
        b=dl3uuOQMo3lHvz7ZLKwGI3xXUutQFEM+LrKlIcxnyJ/p3OfYmJybJEYm45nOOjr6CM
         BULFeoT4Qon4cQ5KipD9aZOdXZ0Pn6HwDAQr9RGjpU2CTenWwCkDZhIo8Z1aYt/0HPD9
         O6Xp8U7LNlWIJloKrVbSesEzOvt6pwolMG6yNtUk6eRwfVuhzwkemCk1gHNlUBWdmdsP
         x5uwL5lRV//vZlGgW4fXUXHKOG1KbcQR0DfktSaGpb+UAKTW0KLQ2GqnQzpxj4wFOSmX
         LyaRihO/gcwwxSjYhcafZ/zDnezAC4uH83WW3AGva5gAhQUPVS3lXCqvJowNIhUP6lUv
         K3Yg==
X-Gm-Message-State: AOAM530YiyFqOBMKyGBlosFuCzp9EJhh37sNzJl9sgu+8cPR7aJmLq+S
        ESExgkpTd0lk7KHcoAo2xXHf9kFa1voBJkZqnluEEw/RSO7qDz4TqT7lKbqIEd2NEbhWiQlvvLJ
        MOm22U7UPcEuzaiVDL3qLGC+XJp0=
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr10129193ejf.274.1639941145204;
        Sun, 19 Dec 2021 11:12:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkQQuRvb9OR2bteZYFpvkxfbT5hhVBIVvwILKa/Sov/v0wg8elPB3vKoTngo/38ZJ9L9WZ4A==
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr10129172ejf.274.1639941144994;
        Sun, 19 Dec 2021 11:12:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c11sm6056757ede.32.2021.12.19.11.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 11:12:24 -0800 (PST)
Message-ID: <0612dcc9-0307-4e8f-0135-851db8d64345@redhat.com>
Date:   Sun, 19 Dec 2021 20:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
References: <20211213120502.20661-1-henning.schild@siemens.com>
 <20211213120502.20661-3-henning.schild@siemens.com>
 <20211215201800.GA28336@duo.ucw.cz>
 <61983e62-bc3d-a711-c197-7436a2e33531@redhat.com>
 <20211219164903.GB28481@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211219164903.GB28481@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 12/19/21 17:49, Pavel Machek wrote:
> On Wed 2021-12-15 21:53:56, Hans de Goede wrote:
>> Hi,
>>
>> On 12/15/21 21:18, Pavel Machek wrote:
>>> On Mon 2021-12-13 13:05:00, Henning Schild wrote:
>>>> This driver adds initial support for several devices from Siemens. It is
>>>> based on a platform driver introduced in an earlier commit.
>>>>
>>>> One of the supported machines has GPIO connected LEDs, here we poke GPIO
>>>> memory directly because pinctrl does not come up.
>>>>
>>>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
>>>
>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>
>> I see that this patch #includes linux/platform_data/x86/simatic-ipc-base.h
>> which gets added by patch 1/4.
>>
>> Pavel, can I take this patch upstream through the pdx86 tree (with you Ack
>> added)? Or shall I prepare an immutable branch with patch 1 for you to
>> merge ?
> 
> Yes, you can.
> 
> 
>>>> +
>>>> +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
>>>> +	{1 << 15, "green:" LED_FUNCTION_STATUS "-1" },
>>>> +	{1 << 7,  "yellow:" LED_FUNCTION_STATUS "-1" },
>>>> +	{1 << 14, "red:" LED_FUNCTION_STATUS "-2" },
>>>> +	{1 << 6,  "yellow:" LED_FUNCTION_STATUS "-2" },
>>>> +	{1 << 13, "red:" LED_FUNCTION_STATUS "-3" },
>>>> +	{1 << 5,  "yellow:" LED_FUNCTION_STATUS "-3" },
>>>> +	{ }
>>>> +};
> 
> But I'd still like better naming than red:status-2.

Hmm, if I merge this and no patch setting a better name is merged
before 5.17 final, then we are stuck with this.

OTOH I think that given the use of this driver, where AFAIK the
use of the LEDs in the field varies, I think this might be the
best name we can come up with.

Regards,

Hans

