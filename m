Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED21330AB6
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 10:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhCHJ6e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 04:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44413 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231386AbhCHJ6L (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 04:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615197491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lHjTxRwBzXntJjnY0Ab0qNZeR7P16kUC/t+zvNtECvA=;
        b=Ktasm3kyUnY8L0r6l81BV9N+xqgZiXrcCzV/yLIt4e3YLooRPjhWzfE+xD5Bbg7cYH1uTJ
        yjBbb5SW/AwpbJ2qqlC0g2OlGocnVKQjVhAwSAjtklO/pkcvmEOtycYUCrTZpeppcLpdQ/
        V3calKFIE0JNBjcYdE2vJECBkBmb9cA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-aBYn7MTZMyGfSBzQvD14kg-1; Mon, 08 Mar 2021 04:58:08 -0500
X-MC-Unique: aBYn7MTZMyGfSBzQvD14kg-1
Received: by mail-ej1-f71.google.com with SMTP id r26so3849702eja.22
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Mar 2021 01:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lHjTxRwBzXntJjnY0Ab0qNZeR7P16kUC/t+zvNtECvA=;
        b=mNnMR7YIH77LNkBKa2UaTOlwcgIHg4T/Yd/ht8/xfAO32dneXOij1xs+SYBQ4tayw4
         jgP7b364Z3p8AHxQahmmxy3uFJr27mXiFrZXQNG2lhau/rQ6xx+I9oik24k6+Q5oNsG2
         ljn+aDD45Jg53OxzFRxTISESisHNdcT7oBqX2TbK4cVIqdv3qmgM7ZVWIoizw4fn9Z4v
         xAsPAudIxi1ERK9/1RiFCKyZm9btc6w0Pr1bmL5rVy+PzGk7zj8kxZ2n1R7oTlN2zReZ
         LgF8IZj98IOvcXh9o04XBR7a0x9014I+jbTi3gIbuXfoJPfH+qn4nADHBANCt2IniDh2
         8lww==
X-Gm-Message-State: AOAM53088zA9mhFI+peN/TE5gyqR3PjX4pghV/uDohq/9t5K/i21Hsz6
        Vdw5ky/PJ0NIuL7IzE4qdDemZ81xVO/ZQrdiKqI7EPowFrPRDVtFL+FH/IRQ96VXu1UzRP/Ldr0
        yHLjIeLJLuQftUsugUon8Kg0iYkvqTwGpVnEumFusOEGx1P8TkfJyO5C4fWamRNiuEcdcanvH8J
        j40A0=
X-Received: by 2002:a05:6402:254f:: with SMTP id l15mr2161740edb.189.1615197487678;
        Mon, 08 Mar 2021 01:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ6fQefjQyWn03VsnOaZl1Am51qstz49gLS1yCwyNiMnlnimfXdBtL7FsXaaQ/90rp9JZYFg==
X-Received: by 2002:a05:6402:254f:: with SMTP id l15mr2161713edb.189.1615197487533;
        Mon, 08 Mar 2021 01:58:07 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b6sm6075855ejb.8.2021.03.08.01.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 01:58:07 -0800 (PST)
Subject: Re: [RFC PATCH v2 2/8] MAINTAINERS: Add entry for devm helpers
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
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
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <cover.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
 <c9119c0a8d4daebff0221c67830b54314fc9e0f6.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c40d1454-836d-cbf2-d2de-232e5b39b9e9@redhat.com>
Date:   Mon, 8 Mar 2021 10:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c9119c0a8d4daebff0221c67830b54314fc9e0f6.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 3/8/21 9:14 AM, Matti Vaittinen wrote:
> Devm helper header containing small inline helpers was added.
> Hans promised to maintain it.

Yes I did promise that, didn't I?  FWIW going this route is still
fine by me, assuming that having someone else maintain this makes
this easier on / more acceptable to Greg.

This is still going to need an Ack from Greg though.

Regards,

Hans



> 
> Add Hans as maintainer and myself as designated reviewer.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d92f85ca831d..ffcb00006e14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5169,6 +5169,12 @@ M:	Torben Mathiasen <device@lanana.org>
>  S:	Maintained
>  W:	http://lanana.org/docs/device-list/index.html
>  
> +DEVICE RESOURCE MANAGEMENT HELPERS
> +M:	Hans de Goede <hdegoede@redhat.com>
> +R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +S:	Maintained
> +F:	include/linux/devm-helpers.h
> +
>  DEVICE-MAPPER  (LVM)
>  M:	Alasdair Kergon <agk@redhat.com>
>  M:	Mike Snitzer <snitzer@redhat.com>
> 

