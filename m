Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E347C3B0502
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jun 2021 14:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFVMqF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 08:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbhFVMqE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 08:46:04 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A7AC06175F
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Jun 2021 05:43:49 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso1655272wmh.4
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Jun 2021 05:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IWa3yvDMZC05F09Gb0TJwUqbgaqCJLtXoPOpUHqNy40=;
        b=HIImoI6qMkUOuMDOIfq/jhmSoNcFXAmToJNHbsufhKclBs5xgHEnnOOELPRwTvhbOD
         VGcrS0iSnncjUBPRUPCzW8VXUVo3VPyeqQH2WcXv7uWsaHfjt6DBXYXVlky5ME0XbhiW
         paEkYrxZk094FkBS2Wqkc5US86GnxzUJaj8wr0ATVa6Gc1wgC1wjisOCaIBdIeKFhaDW
         h+d6BeC4Ebo+XqYmQGQ5FyayvodsGiLbwrtOb3Nl5VB/jFq5R2FjJxWYCIQLzd3VrRK6
         FdZuOINbex9KtjIegfbcb3xW5hzoSHANtmujLhsTdltypEBwM5MqocIBRSvPTszZiqyo
         kExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IWa3yvDMZC05F09Gb0TJwUqbgaqCJLtXoPOpUHqNy40=;
        b=l1it3Bg5H4jRDCpiD1JPD/NeEUsY5a5f/qsPrjK0SYadrDBClABawmbU+/+SLb2Unc
         aRrCdvjW8mOjTxYmXP28V5qHN483TQ5USOojEFjxreDMSm6sRzYZJdpxr2cVlvO2glY6
         2+49J6XlarrWUiVmJobUzZZrfTeKYxh0t4yEaW+kzpZQuESu/ONhFlHXdQW20VtKN5KD
         11yelOGhRK8owEdrlj9pJrK4p/200NRIIP3/h1g4jQQ1H+TNUKEi45VdwEu+jD4zadK3
         VNdE7RwwzjTrnzKGiTz/uJt3DfqOp0Mv0K5CM87Ld3AVGax5HbjPWiQerCbrEGQBIW+P
         R5ug==
X-Gm-Message-State: AOAM532haNMMl1YXG6pFJIqXuGtuhU0aG1ummcWjTEwPMZ68IwJ4QUe7
        y0aQtrh1WZXLF1o0C/nqZzILKA==
X-Google-Smtp-Source: ABdhPJy5rQuRGuARhz/vMpwS+ZMRIV5SVmAckD49snpPgMD2hPstEquQIk0YQn0Zld5AvrodGx2snQ==
X-Received: by 2002:a7b:cb1a:: with SMTP id u26mr4283571wmj.125.1624365827472;
        Tue, 22 Jun 2021 05:43:47 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b049:62d0:2ee2:34f7? ([2001:861:44c0:66c0:b049:62d0:2ee2:34f7])
        by smtp.gmail.com with ESMTPSA id s16sm9517373wrm.36.2021.06.22.05.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 05:43:47 -0700 (PDT)
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: improve
To:     Art Nikpal <email2tema@gmail.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-kernel@vger.kernel.org, Artem Lapkin <art@khadas.com>,
        Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
References: <20210622095639.1280774-1-art@khadas.com>
 <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
 <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0d5e53b2-873e-0ffa-32eb-87e96b51e263@baylibre.com>
Date:   Tue, 22 Jun 2021 14:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 22/06/2021 13:53, Art Nikpal wrote:
>> Neil
>> Can you split the patch in 4 distinct changes ?
> 
> yes  no problem i can try to do it tomorrow !
> maybe somebody have other ideas, suggestion, comments ...

The changeset is clean, and overall I'm ok with the changes, but I'm pretty sure the wdt maintainers
will prefer separate changes in order to comment of each.
Neil

> 
> 
> On Tue, Jun 22, 2021 at 7:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi Art,
>>
>> On 22/06/2021 11:56, Artem Lapkin wrote:
>>> Improve meson_gxbb_wdt watchdog driver
>>> 1) added module param timeout and nowayout same as other modules
>>> 2) print watchdog driver start status
>>> 3) add watchdog_stop_on_unregister
>>> 4) remove watchdog_stop_on_reboot ( still can be activated by
>>> watchdog.stop_on_reboot=1 ) i think this driver configuration more useful
>>> becouse we can get reboot waranty for abnormal situations on shutdown stage
>>
>> Can you split the patch in 4 distinct changes ?
>>
>> Neil
>>
>>>
>>> Signed-off-by: Artem Lapkin <art@khadas.com>
>>> ---
>>>  drivers/watchdog/meson_gxbb_wdt.c | 20 ++++++++++++++++++--
>>>  1 file changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
>>> index 5a9ca10fbcfa..15c889932c13 100644
>>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>>> @@ -35,6 +35,17 @@ struct meson_gxbb_wdt {
>>>       struct clk *clk;
>>>  };
>>>
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>> +static unsigned int timeout = DEFAULT_TIMEOUT;
>>> +
>>> +module_param(nowayout, bool, 0);
>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>>> +                     __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +
>>> +module_param(timeout, uint, 0);
>>> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
>>> +                     __MODULE_STRING(DEFAULT_TIMEOUT) ")");
>>> +
>>>  static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
>>>  {
>>>       struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
>>> @@ -174,7 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>>       data->wdt_dev.ops = &meson_gxbb_wdt_ops;
>>>       data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>>>       data->wdt_dev.min_timeout = 1;
>>> -     data->wdt_dev.timeout = DEFAULT_TIMEOUT;
>>> +     data->wdt_dev.timeout = timeout;
>>>       watchdog_set_drvdata(&data->wdt_dev, data);
>>>
>>>       /* Setup with 1ms timebase */
>>> @@ -186,7 +197,12 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>>
>>>       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>>
>>> -     watchdog_stop_on_reboot(&data->wdt_dev);
>>> +     watchdog_set_nowayout(&data->wdt_dev, nowayout);
>>> +     watchdog_stop_on_unregister(&data->wdt_dev);
>>> +
>>> +     dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
>>> +             data->wdt_dev.timeout, nowayout);
>>> +
>>>       return devm_watchdog_register_device(dev, &data->wdt_dev);
>>>  }
>>>
>>>
>>

