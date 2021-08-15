Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2212B3EC6A5
	for <lists+linux-watchdog@lfdr.de>; Sun, 15 Aug 2021 03:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbhHOBdv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 Aug 2021 21:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhHOBdv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 Aug 2021 21:33:51 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A46C061764
        for <linux-watchdog@vger.kernel.org>; Sat, 14 Aug 2021 18:33:22 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id n1-20020a9d1e810000b0290514da4485e4so13993319otn.4
        for <linux-watchdog@vger.kernel.org>; Sat, 14 Aug 2021 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QNg6DHPO36uwXaa8JMydyWibJnVxQgOHhmUSoxi0VUk=;
        b=B6c4vcI+x0jDCfu00mhI18NQygq3uDDYeFE+pZwU+nbDCg470+yCiTUoRWJpClgIA7
         VlV1rabodbP3kLF4CQtNWpp4a4tpnjAtTdMWw47OhCacf0zd/xf+YA+px7OKitaSXU/G
         EE9SxDYoFUms2ig74MpFjZ3NJG6eW01J2rN8vkxrqsQtSLuP4lK8RISRPrEXQkZ9Qt61
         5iBUyIH1WsieG8dnW2B7SeDmRdfS+TvIfM2PIgX7GtBzarQ0nvNHWhjFj2OVvOXwVaEh
         tSgtdobJmdJDaEivzYSpM0qGmcVby3HtBuzqZiLzQvDDe/vTqORxUiKfWKiFd6qsGg78
         GFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QNg6DHPO36uwXaa8JMydyWibJnVxQgOHhmUSoxi0VUk=;
        b=MQqKhu4E2ibcPgUbkCnve77vPP5TpJBnOaCbrmk5A8NyNwAhRFqXk1bVoDMC47+l2c
         CW8mSBGciaS0Wnp1C2JhOse+l5xfm9MUdZ3P8EEpn16fZqA0Y53Av6zhP2HTQSfPrqCt
         wWUzpKeoQcVFFRGvzVLlUVE9fO1FvwBk4rVN+Ficj/kbjxzfCCowzlBPiZ91//YrQQVq
         RfSMkaEmeNB8l6nW5T4m1qVLxeX3xRPOW0InyuVMlQ4eRlTw4JPu9zNQqPWGyS8sLXaT
         1wAwhy32Jowf0mmxHJjmzUT2sE+UUa8yPXUW5CSt6ZbR4rxWiKMXrgtI954YJVrvtcSw
         iToQ==
X-Gm-Message-State: AOAM532Y5rBGv73i0aJbpXQkqFb5gIMmbRNAhRNyurVmOpOYTSZHFNLU
        AFrjdT/xgAuVJJMosqkUDWIcXb0zA3Y=
X-Google-Smtp-Source: ABdhPJyJ0gfzb4ft7BAi2hRc4ms18BQ1+9bIhuLstTgjnvVfVAz8Cr5bgpVz1sBYtwf79WJ73NrdCQ==
X-Received: by 2002:a05:6830:1bc5:: with SMTP id v5mr4087003ota.329.1628991201441;
        Sat, 14 Aug 2021 18:33:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u18sm1220649ooi.40.2021.08.14.18.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 18:33:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Device must be opened for writing
To:     Stanislav German-Evtushenko <ginermail@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20210814191345.27221-1-ginermail@gmail.com>
 <20210814195646.GB3951799@roeck-us.net>
 <CAPeRZrV+HwdmBKFB3tmG_tEHjsR8h3WLxKQYGDLOLgw178oq=A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b9818198-48f1-c75e-2dbe-eabfc36b6725@roeck-us.net>
Date:   Sat, 14 Aug 2021 18:33:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPeRZrV+HwdmBKFB3tmG_tEHjsR8h3WLxKQYGDLOLgw178oq=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/14/21 5:19 PM, Stanislav German-Evtushenko wrote:
> On Saturday, August 14, 2021, Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
>  > On Sun, Aug 15, 2021 at 04:13:45AM +0900, Stanislav German-Evtushenko wrote:
>  >> If userspace opens the watchdog device self-feeding stops. Sometimes
>  >> opening the device happens by accident, e.g. by mistakenly running grep
>  >> recursively in a wrong directory which leads to the server being reset.
>  >>
>  >> Watchdog device does not handle read operation therefore the issue can be
>  >> prevented by requiring the device to be opened for writing:
>  >>
>  >> - Prevent opening the device without FMODE_WRITE
>  >>
>  >> Signed-off-by: Stanislav German-Evtushenko <ginermail@gmail.com <mailto:ginermail@gmail.com>>
>  >
>  > NACK. That would be a major undocumented ABI change. Opening /dev/watchdog
>  > for reading can be and is used today to test a watchdog.
>  >
>  > Guenter
>  >
> 
> I see. This is unfortunate.
> 
> In this case I'll try to find the right place in the documentation and make it more explicit unless it is already there and I've overlooked.
> 
No. That isn't the point. This is used and must not be changed.
Again, people (including me( are _using_ this to test watchdogs.
We are not going to disable that because some people are not
careful when executing commands as root.

Guenter
