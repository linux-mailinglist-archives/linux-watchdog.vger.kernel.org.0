Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B976B38E001
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 May 2021 06:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhEXEEv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 May 2021 00:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhEXEEu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 May 2021 00:04:50 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80283C061574;
        Sun, 23 May 2021 21:03:23 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso24031239ote.1;
        Sun, 23 May 2021 21:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0qrdlvQfC6wdYEDTbq77wkL5WtEbBU0ry3Il5rk6/SU=;
        b=dhi2Q4aWAk8boGu3I3o9UHzDEX6U6O3u3Gp9xyzY1yYXANCTHbRqg06jrXWvql0fjx
         KhBMfQLCyGarc+DgTvcOxkbPMuJgAkXllZCDrCAtdN56C+oLESZnJbRCnEpit+ergWbZ
         je2lRsAcTk0hH4A8kV4rODbmB1ICjQAXOQh3kkHFlapjj6ijXJQchmNVIwGSeJ8dW7L9
         lMlYOYlVgy4cifu1ucTEh7yXwJedM0vITrM5c5eppHMT14vIU44JzAo3JeRuYcicCmOq
         SBOrnEV5O2gpN7MDrWROTNec3xOUi44Jris1wUcTw56Trnue++lBECLNh92X3y61wJVl
         hh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0qrdlvQfC6wdYEDTbq77wkL5WtEbBU0ry3Il5rk6/SU=;
        b=B//sZmVc98KNABQEUmfAcWAAvC2SPtWsu1ECTQ91Q9BCfS9kNyU3VL/ed0n7WDrY7v
         xzLOWemTkq77spkZGiQrgXkkJTsWgiUmfKT0LRmd7O91nmETI2lv5TMPN+PJP4jbJkVq
         cz19sK1NP8pHuUERSeITCwzHlJwRC4I03bsuxqraGRyIqGShoVpk6Be/NcQmhxQVyOa5
         yZzx+BuEXBuvhBen/T89TlvSPzIV0BFYFImz7xq5x4dCCo8O0SFO5KmMzr4siYLyoOYx
         qPKPY8jKE5zo5LMpyfZTAAuCr++6FU6GD5jIqPs/bbosyXCUjHnBmLG7+EAfRh1IxJpX
         qHCA==
X-Gm-Message-State: AOAM533jeMeHdwj4zNndnXI5USXrZtpBJy7cqkhPuqp4+kJBz3qtvlv1
        rYdI/JrKV2bEM76aII4kIJo=
X-Google-Smtp-Source: ABdhPJzJVFX6hWLuiu0/gMMfFjMeE6H1eaXdb2vv096Sy8DTTz9WEX36pLavPVytI6xlHAuBaZIUlA==
X-Received: by 2002:a05:6830:108c:: with SMTP id y12mr16068420oto.319.1621829002804;
        Sun, 23 May 2021 21:03:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q14sm2580608ota.31.2021.05.23.21.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 May 2021 21:03:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: qcom: Move suspend/resume to
 suspend_late/resume_early
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
 <20210310202327.GA237124@roeck-us.net>
 <948130ae3a0781eb19b7431059852c23@codeaurora.org>
 <7bbfb6af534c22cd1e50f16aadd412c1@codeaurora.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3f76d6cc-df32-6bf3-9971-4ca8f0ee8169@roeck-us.net>
Date:   Sun, 23 May 2021 21:03:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7bbfb6af534c22cd1e50f16aadd412c1@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/23/21 7:38 PM, Sai Prakash Ranjan wrote:
> On 2021-04-20 11:13, Sai Prakash Ranjan wrote:
>> Hi Guenter,
>>
>> On 2021-03-11 01:53, Guenter Roeck wrote:
>>> On Thu, Mar 11, 2021 at 01:50:04AM +0530, Sai Prakash Ranjan wrote:
>>>> During suspend/resume usecases and tests, it is common to see issues
>>>> such as lockups either in suspend path or resume path because of the
>>>> bugs in the corresponding device driver pm handling code. In such cases,
>>>> it is important that watchdog is active to make sure that we either
>>>> receive a watchdog pretimeout notification or a bite causing reset
>>>> instead of a hang causing us to hard reset the machine.
>>>>
>>>> There are good reasons as to why we need this because:
>>>>
>>>> * We can have a watchdog pretimeout governor set to panic in which
>>>>   case we can have a backtrace which would help identify the issue
>>>>   with the particular driver and cause a normal reboot.
>>>>
>>>> * Even in case where there is no pretimeout support, a watchdog
>>>>   bite is still useful because some firmware has debug support to dump
>>>>   CPU core context on watchdog bite for post-mortem analysis.
>>>>
>>>> * One more usecase which comes to mind is of warm reboot. In case we
>>>>   hard reset the target, a cold reboot could be induced resulting in
>>>>   lose of ddr contents thereby losing all the debug info.
>>>>
>>>> Currently, the watchdog pm callback just invokes the usual suspend
>>>> and resume callback which do not have any special ordering in the
>>>> sense that a watchdog can be suspended before the buggy device driver
>>>> suspend callback and watchdog resume can happen after the buggy device
>>>> driver resume callback. This would mean that the watchdog will not be
>>>> active when the buggy driver cause the lockups thereby hanging the
>>>> system. So to make sure this doesn't happen, move the watchdog pm to
>>>> use late/early system pm callbacks which will ensure that the watchdog
>>>> is suspended late and resumed early so that it can catch such issues.
>>>>
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>
>> Gentle Ping. I don't see this in linux-next or linux-watchdog, please let
>> me know if anything is pending from my side.
>>
> 
> Gentle Ping !!
> 

It is my watchdog-next branch. At some point Wim will hopefully pick it up.

Guenter

