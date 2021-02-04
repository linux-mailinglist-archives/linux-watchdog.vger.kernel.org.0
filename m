Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2174530F0F8
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Feb 2021 11:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235484AbhBDKfG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Feb 2021 05:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235540AbhBDKdn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Feb 2021 05:33:43 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C58AC061573
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Feb 2021 02:33:03 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l12so2912895wry.2
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Feb 2021 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hsN/OapOEplhri1ngP6qr+RO+51gU8IM8nQPOqxMvVQ=;
        b=EH3VfFhRjeXA5UtS/Yj+qDHIfaYbcWFBhV9MxtZ+xXWzTjfYWRujowx5LH9RKJIKMA
         WtyM2sMythgEQqf75Rn8DEEEeTX7zQpC46tppaAgrdqPN1DHFgTmgOQeORoqKQllaiFm
         kDVryYMeAD4kPWq5ziqL37Ml2HWdGzcBZqPYSgczVxihAe4aty8rzr/axgVWbkFHbnZb
         yCpV+gmR9HaUNPsjgPSMfivNdZyOS3mbjlvgk6NbYJn1krCRsbskztFZyAnZu2ryFnYU
         r7s0bxc6qAxgUSdwswooOSCqKhrdDX7Ww+wENsY+aT95cOYyAHbf1ba0YyMoCKHAkxDS
         heuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hsN/OapOEplhri1ngP6qr+RO+51gU8IM8nQPOqxMvVQ=;
        b=TrknS40qjPcW853VerNNUCky2JVEtUOYY1nIFVhwM9qMebdy4aIM0vV/GboAJZcQkP
         Fury9clx4pLfVMQzRr60KKghtQMJnn5rk3FcEszUJW2AdIp+BPSSORYayDc6hyTOvP64
         CoPE+A/hMm9DE/PQ06ynvVYWIhEGrP3YTIWOz08HpyHCI4rL0o9Edp3UHKgneiWNoet3
         snb4f9x6stNu93XbO7BD3xxkykI0pflff5HYbgciBQRdc660JMvkM1u8ab0pFafaKP3/
         u3Qhl7JY49UtY2BiTdVzQoewRuFPMwqMLJVmj4zBA+UG4OksHgcGXRb/YfFpKdl/YJ4W
         gemw==
X-Gm-Message-State: AOAM533f8cLgswFPaAqEgOvnX5il5QX8KPN/qaJ+jGppAMANl23QSQL8
        FvDParIpAmC9BPgi4gEHPwgecw==
X-Google-Smtp-Source: ABdhPJxHWLcMprdKmr42u2S4LwyYNw2r3RuA7Pr0JTirLj5GS/slybEW2EcRSZFRbhWP+hBUdlOhpQ==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr8670513wrq.425.1612434782343;
        Thu, 04 Feb 2021 02:33:02 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m205sm5665340wmf.40.2021.02.04.02.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 02:33:01 -0800 (PST)
Date:   Thu, 4 Feb 2021 10:32:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [PATCH v6 2/6] mfd: ahc1ec0: Add Advantech EC include file used
 by dt-bindings
Message-ID: <20210204103259.GB2789116@dell>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
 <20210118123749.4769-2-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118123749.4769-2-campion.kang@advantech.com.tw>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 18 Jan 2021, Campion Kang wrote:

> This files defines the sud-device types and hwmon profiles support by
> Advantech embedded controller.
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  include/dt-bindings/mfd/ahc1ec0-dt.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/ahc1ec0-dt.h

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
