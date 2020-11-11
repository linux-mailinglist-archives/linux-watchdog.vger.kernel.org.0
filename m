Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146B72AF3EB
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 15:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKKOmC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 09:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgKKOmC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 09:42:02 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2089C0613D1;
        Wed, 11 Nov 2020 06:42:01 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id w145so2384532oie.9;
        Wed, 11 Nov 2020 06:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aWiu0+ECTjr5vhNp4Z4/0HtNupL7ktmR+PUkWYfSlEQ=;
        b=i0uZPGQKa+m73FnK8cNBB1wjW+dToO/3RkElBMmF3EtC316mqHWRcolBE4Z/LUU6eP
         r/3NUrz4exKv62+gywKbk2RAtZ2f5n/nRXlsu6SH3MleBgiO7NCFw+fslltGNrZ+KQhi
         WLACXoM/LRhoRtcj2rrBhJ51ImQz9pAnAxqwv1A/HJCmPgn0jF3FybOqkzMknSAb3Kgx
         xnatG+XflLxDuSmbRsAwpd3vcFhLsI0Fmhg5tq926Fe28JoXdNXnP7PL2UpNYsEngYDx
         NI593JOCQuZDQFUrspip/9f0jlA5M3UV4kt4nWG28g5/681Vh9t6hRf7qp3zuwV/NqCU
         i68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aWiu0+ECTjr5vhNp4Z4/0HtNupL7ktmR+PUkWYfSlEQ=;
        b=OFLaVyQfqeyVFAOLcP530OWby7LBsjHv51LaLlP4013rSjvgUy6pS5jeSpLheVjVWW
         h2ygFBE4Uox/BY6l2h0I5wtcJltpaoOVRDKhoccT4OjGeHzvXYVW1TUw/9gM5WrXSnHq
         qkg2L0WxtfsE0q0YZCXaBE4LSGZ5z7reVpWgjYH4/cmkSEHSnZf4lhGCSbs0X6sxOBox
         XG4GK7uWPfR5a50s+ZOcRQBW/v6flF/EydsD87DOFtMGm78GdY916IHpCdPeC7Q9pJ/U
         TCIi3EmSUMbgtjz1rAEQE/sthd8V+l6gvVnA2T2b4jjnTi+LuetobtijNtAVLKSOj9tG
         pWVA==
X-Gm-Message-State: AOAM532D28lHO7aYQ07U4sZGLGGGp7OUDNXG44BDMNbS74aWxIE+Mm2B
        OQwxkjQeLuYe5FF87ttVjiY=
X-Google-Smtp-Source: ABdhPJwRxwzxCeLiVKUpy90hTgxPh3TYraDuPtOIFY1wNNVF81cp7pB7pTj1dFoav3a97DdMmejHIQ==
X-Received: by 2002:aca:f083:: with SMTP id o125mr2210648oih.164.1605105721344;
        Wed, 11 Nov 2020 06:42:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 12sm464420oiq.9.2020.11.11.06.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 06:42:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v5 3/4] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
 <1a454defaf65ecc22deb0fe42a1384a5f9d5a771.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
 <7d912f9a9c1aa2be3d73287401fd2088a63b899c.camel@fi.rohmeurope.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2f455295-9c48-c9a7-8d70-90339833eb94@roeck-us.net>
Date:   Wed, 11 Nov 2020 06:41:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d912f9a9c1aa2be3d73287401fd2088a63b899c.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/11/20 6:01 AM, Vaittinen, Matti wrote:
> On Thu, 2020-11-05 at 13:38 +0200, Matti Vaittinen wrote:
>> Add Watchdog support for ROHM BD9576MUF and BD9573MUF PMICs which are
>> mainly used to power the R-Car series processors. The watchdog is
>> pinged using a GPIO and enabled using another GPIO. Additionally
>> watchdog time-out can be configured to HW prior starting the
>> watchdog.
>> Watchdog timeout can be configured to detect only delayed ping or in
>> a window mode where also too fast pings are detected.
>>
>> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>
> 
> //snip
> 
>> +	ret = of_property_read_variable_u32_array(np, "rohm,hw-timeout-
>> ms",
>> +						  &hw_margin[0], 1, 2);
>> +	if (ret < 0 && ret != -EINVAL)
>> +		return ret;
>> +
>> +	if (ret == 1)
>> +		hw_margin_max = hw_margin[0];
>> +
>> +	if (ret == 2) {
>> +		hw_margin_max = hw_margin[1];
>> +		hw_margin_min = hw_margin[0];
>> +	}
>> +
>> +	ret = bd957x_set_wdt_mode(priv, hw_margin_max, hw_margin_min);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->always_running = of_property_read_bool(np, "always-
>> running");
>> +
>> +	watchdog_set_drvdata(&priv->wdd, priv);
>> +
>> +	priv->wdd.info			= &bd957x_wdt_ident;
>> +	priv->wdd.ops			= &bd957x_wdt_ops;
>> +	priv->wdd.min_hw_heartbeat_ms	= hw_margin_min;
>> +	priv->wdd.max_hw_heartbeat_ms	= hw_margin_max;
>> +	priv->wdd.parent		= dev;
>> +	priv->wdd.timeout		= (hw_margin_max / 2) * 1000;
> 
> Hmm. Just noticed this value does not make sense, right?
> Maximum hw_margin is 4416 ms. If I read this correctly timeout should
> be in seconds -  so result is around 2 000 000 seconds here. I think it
> is useless value...
> 
> Perhaps
> 	priv->wdd.timeout		= (hw_margin_max / 2) / 1000;
> 	if (!priv->wdd.timeout)
> 		priv->wdd.timeout = 1;
> would be more appropriate.
> 

Yes. Good catch. Actually, since max_hw_heartbeat_ms is specified,
it can and should be a reasonable constant (like the usual 30 seconds).
It does not and should not be bound by max_hw_heartbeat_ms.

> I need to do some testing when I get the HW at my hands - please don't
> apply this patch just yet. I will respin this after some testing - or
> if other patches are applied then I will just send this one alone.
> 
> Sorry for the hassle...
> 
No worries. Thanks for noticing.

Guenter

> --Matti
> 
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> 
> Simon says - in Latin please.
> "non cogito me" dixit Rene Descarte, deinde evanescavit
> 
> (Thanks for the translation Simon)
> 

