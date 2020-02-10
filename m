Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57928157D55
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2020 15:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbgBJOZj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Feb 2020 09:25:39 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35107 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbgBJOZj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Feb 2020 09:25:39 -0500
Received: by mail-pg1-f195.google.com with SMTP id l24so4011082pgk.2
        for <linux-watchdog@vger.kernel.org>; Mon, 10 Feb 2020 06:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AXBkhZzKdKxwGIXw4ADNoEHCoihZ/K5+LwaV913MLy0=;
        b=f2ZVznRX1U9ClKU+NP/F9+PYel0pzFUgcjfywt/EpexyZQsn44418Xju2mxWS8WrlS
         Z1thCTkAsIMl4fYJwuDleKSPG3ouR5MTNi5NKHy8+evFsfgB51Zj8ApRQhVl+HpeI8yf
         2ozYG9q0OOEDwobKhPMiaH/2aIyVBREX5BC7bX4h+0bQeGOLXbxJN1vv16yrNMPSp6cz
         OZtOtZyDdcEIfpzhhnJhfXn0BhwGhwkiiiT5o5osy2QK6+wsbD551WIwLTAqWEcCNlMt
         UBJlkA+wZeZYGKDv2FWOw5k9RGmaFxPG72DrPr5+xlpgTEp5hVdetHkDszoGZOEDtlW/
         rRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AXBkhZzKdKxwGIXw4ADNoEHCoihZ/K5+LwaV913MLy0=;
        b=fvnWscXXvTJBdvyl0S9cqhJkkcSrKcJxCVjitng67qkreA/IobQKfECKHePH3Fg2j/
         IleJgbsX5KfizKdKeSS3kP9L2l3WQ9K0QHtMBFQbGA5WG0E7s00M65thlE37vnP98f/k
         wMhpMamp3e75+SKb8z7rBh66b2C5tK8aRHHDXB0rlSOsnB0sVdHOq2NjtYulVMeI0S/n
         REelMMB2kIhbblPxLCLxU2BC2JGpRQx15YCfO/BT1Ky2r2CZLbuWerOZE+wwyLHCTmKg
         bgn55GMkHqolspK3vkAgqhoisTkKYgm/qeLU/NPwwxnQhKVbdRDBc/A8/cmjq8PlvD/J
         qYDQ==
X-Gm-Message-State: APjAAAUSsmvEgcGTqrZXs5AtdBE3EcW2ctXecMezB9LGWZGAV/VEEklr
        Mijr8N6D3BCsUUFoh1ShrTE=
X-Google-Smtp-Source: APXvYqx+DUfpWQ8VSRKEBGe10WN47E1DfcTfXE5IuwHox5JWM8RCVTmLwG+5030/xI73Wre/csQDAQ==
X-Received: by 2002:a63:3487:: with SMTP id b129mr1946087pga.320.1581344738700;
        Mon, 10 Feb 2020 06:25:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p3sm597375pfg.184.2020.02.10.06.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 06:25:37 -0800 (PST)
Subject: Re: [PATCH RESEND] watchdog: wm831x: Use GPIO descriptor
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
References: <20200210102209.289379-1-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <26fc06fb-fd1d-064b-4015-d68a98369ecb@roeck-us.net>
Date:   Mon, 10 Feb 2020 06:25:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210102209.289379-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/10/20 2:22 AM, Linus Walleij wrote:
> The WM831x watchdog driver passes a global GPIO number from
> platform data into this driver, this is discouraged so pass
> a GPIO descriptor instead.
> 
> More thorough approaches are possible passing descriptors
> associated with the device through machine descriptor tables,
> but no boardfiles in the kernel currently use this driver
> so it is hard to test.
> 
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Interesting, I don't see evidence of the original patch in
watchdog patchwork.

Anyway, it seems to me it would be better to remove the gpio code
entirely from this driver. It is instantiated from an mfd driver
which doesn't set the gpio pin. It is quite unlikely that it is
ever going to be used, so we might as well remove it (instead of
modifying it without ability to test it).

Thanks,
Guenter
