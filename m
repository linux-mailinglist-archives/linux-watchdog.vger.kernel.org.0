Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755BF31AC6C
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Feb 2021 15:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhBMOxk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Feb 2021 09:53:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53491 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229693AbhBMOxi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Feb 2021 09:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613227931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l4ytx6mSORryC9/ckDkwUt9Y5elBZy+A8DMLR/SeLFA=;
        b=YkBb++FqeCQexIcmLPVkI5USioZuspB2wIiOToCT7mhsRmPb5LgLGjA5vsN5KfVKGLI4Sq
        boDY8iQv3jbvgvt02p1HnkG+nYZnQRLr/wr/osuMwrtu129NApDYIzz8ou21qZeXHE/vLP
        YSXa/Vpz6Vc3eu0RNddpjhrrRj2HSXU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-vQFrODuEO_qmhxXdjjW9zg-1; Sat, 13 Feb 2021 09:52:09 -0500
X-MC-Unique: vQFrODuEO_qmhxXdjjW9zg-1
Received: by mail-ej1-f70.google.com with SMTP id yc4so2365431ejb.2
        for <linux-watchdog@vger.kernel.org>; Sat, 13 Feb 2021 06:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l4ytx6mSORryC9/ckDkwUt9Y5elBZy+A8DMLR/SeLFA=;
        b=soGowN6Rjmj/Sg7guKLHpPHmRXV2/Srtdfg8kv+Tg/fUWH9Jb48bjSqFT4CU/XVVIS
         1GX1HxElN7V1kwe22naQrqCT7NXw1xxz3ORo6txd4vK3mFbU6HqDAby9rzfuXk8y1BKn
         KPLRPY7RaUOM0f2qjIP4+y3XDQapvWtHS7s7AHloOHg/m2NMZcjj56sVjqjftz3cOk1w
         FGQISi/WUb4wqU7KHxssYAlnLw4jwVEDWz3TqfBw+1Xl8aD6rKO64tLpYqzL1dY6Jc7u
         IH39CgT392ZrvdEMK/K5o3etyjwVbw65t+B0EQLVTVmQxj43EYAgrCi2Zzk5L1+KQ6IF
         IV0w==
X-Gm-Message-State: AOAM533J3CTh58sHe0KYxSxjwbOdTK10ZwePNIqKtF00SmLGxEKl41TQ
        L9jGlo/9SbVP6WiLgXO654Lmio4sCtS4gyRo0cgo2GU9sIEynrBzgBrxwDjoM+qIJTtP+gKp0vm
        BJgltjsq1H75tsLFIbZ3dzIR02MPb9furl4Pk3Huucq0MHikHW2bkRWBccaISk9ZgJSqbzoytoc
        z9RpY=
X-Received: by 2002:a17:907:9702:: with SMTP id jg2mr7971748ejc.48.1613227928360;
        Sat, 13 Feb 2021 06:52:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+usicOJdFKmvK0rRWYdbK1mDMpi9ZfQVA/OyFldns5N6tfGUHahQmjNCyMiVXxtGpFFsc3w==
X-Received: by 2002:a17:907:9702:: with SMTP id jg2mr7971712ejc.48.1613227928165;
        Sat, 13 Feb 2021 06:52:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dk18sm7308096edb.92.2021.02.13.06.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Feb 2021 06:52:07 -0800 (PST)
Subject: Re: [RFC PATCH 1/7] drivers: base: Add resource managed version of
 delayed work init
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <mgross@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Saravana Kannan <saravanak@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <1230b0d2ba99ad546d72ab079e76cb1b3df32afb.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <YCfDAly9b0zHMpJT@kroah.com>
 <284d4a13-5cc8-e23c-7e99-c03db5415bf1@redhat.com>
 <YCfVKyXbeJXNbMsd@kroah.com>
 <eecf8ad6-a99d-8ad0-fc7e-f87d015add3f@redhat.com>
Message-ID: <529a5122-ff3a-2af0-52ed-b13216fa49d1@redhat.com>
Date:   Sat, 13 Feb 2021 15:52:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eecf8ad6-a99d-8ad0-fc7e-f87d015add3f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 2/13/21 3:38 PM, Hans de Goede wrote:
> Hi,
> 
> On 2/13/21 2:33 PM, Greg Kroah-Hartman wrote:

<snip>

> Having this new devm_delayed_work_autocancel() helper will allow a
> bunch of drivers to move away from mixing the 2, which is a good thing
> in my book.
> 
> As I said above I believe that having devm_delayed_work_autocancel() (1)
> in our toolbox will be a good thing to have. Driver authors can then choose
> to use it; or they can choose to not use it if they don't like it.
> 
> I know that the reason why I did not use it in the
> drivers/extcon/extcon-intel-int3496.c driver is because it was not available
> if it had been available then I would definitely have used it, as it avoids the
> mixing of resource-management styles which that driver is currently doing.
> 
> And I think that that is what this is ultimately about, there are 2 styles
> of resource-management:
> 
> 1. manual
> 2. devm based
> 
> And they both have their pros and cons, problems mostly arise when mixing them
> and adding new devm helpers for commonly used cleanup patterns is a good thing
> as it helps to get rid of mixing these 2 styles in a single driver.

I just noticed that I forgot to fill in the (1) footnote above:

1) And we probably will want one for non delayed work items to: devm_work_autocancel(),
but lets cross that bridge when we get there.

Also when reviewing: "[RFC PATCH 2/7] extconn: Clean-up few drivers by using managed work init"
I noticed that the extcon-qcom-spmi-misc.c and extcon-palmas.c follow the same standard
pattern of having an IRQ which queues a delayed work and they both miss the devm_free_irq
call before the cancel_delayed_work_sync() on driver release. So just patch 2/7 here
fixes 3 driver-release race conditions (fixing 3/4 drivers which it touches) as a
bonus to the code-cleanup which it does.

So as this clearly seems to be fixing a bunch of bugs, by simply completely removing the
buggy code driver remove callbacks, this really seems like a good idea to me.

Regards,

Hans

