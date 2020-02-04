Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6810151DE2
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 17:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgBDQKA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 11:10:00 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41497 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgBDQKA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 11:10:00 -0500
Received: by mail-pl1-f196.google.com with SMTP id t14so7447914plr.8;
        Tue, 04 Feb 2020 08:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M036szbw/Pk/I+CIiaZVdXTXPif6yF7ag78de9WAcs8=;
        b=hp+6POfi1kWtZCwhyBEjL90H4w5mLZJpAmmerc/8oj2xpBRTNE/QXqxVWPkCDw9Aka
         aqvdInaZ3awDQAKAKbTklA7lJ2GHs0mvczd7dccMY06TtgXIY86kzfRRy24FU38+mkHg
         S/uykEBjXqXJOnJS3fkf/2QX+NneD4I800sPtKX2C7q3DTYDCD39A/vUijkA+h5hNNNp
         5SuvZlfKSEa2lBq+2EX7mnNWjrSUpgoSAi+9o9nHUKDcQBFMNTuHITqI8aKCfGkBfZlL
         PrY2RbQURPQCyJQ5JViEkUx5rqFakbRVVSR3aGoRcVg6+I92zGyYwa1BB8N4NBST8wHH
         NSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=M036szbw/Pk/I+CIiaZVdXTXPif6yF7ag78de9WAcs8=;
        b=m2baE7lIX1tsGaagC6npfaSGQhUO24QD2zOmqQ0FGOtpADjEji8aBDJ14AuXdTwS4t
         2+MPhZeEfPfrQMQXCgrauzoXJmO1Y1JgwQHYnpXUZb8sA+cXGyBP/6Zz9xP2y85YpYmP
         RwBIx/iB4xHsO9wUb/URDc6Lc/Fjt3lfDOkvJpbtiZjiKe67GMALipDw+gF/3jAIiWEy
         rkp9THpKLBdmXc47zjsfSQPvDB2XSSCro3b8wUYUXkmEbSTveMMkXIg2QVP6beMAoZDF
         xcrcE23LvrVfrylR62OY4RO/RtLDHI4fVB1HPrHbaDD64M0OjtYDv/g2AgZzVWcofIll
         rvFA==
X-Gm-Message-State: APjAAAXh1Owm06mDArmzuEogNJ5mBH6BxyuHx0fHZRNJQ04r5FKCjpW0
        RYPQS8kojkLriauh1aC2Pz4=
X-Google-Smtp-Source: APXvYqzjCO2uGkgFPawiFh4jcAW9gCx0uEYBzgiABe61LKMl3zAQaS9432W2E/ohK2qac0PrZdJpuw==
X-Received: by 2002:a17:902:ff07:: with SMTP id f7mr29356171plj.52.1580832599514;
        Tue, 04 Feb 2020 08:09:59 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p123sm7167983pfg.84.2020.02.04.08.09.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 08:09:59 -0800 (PST)
Date:   Tue, 4 Feb 2020 08:09:58 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: watchdog: qcom-wdt: Remove deprecated
 compatible
Message-ID: <20200204160958.GB17320@roeck-us.net>
References: <20200204152104.13278-1-ansuelsmth@gmail.com>
 <20200204152104.13278-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204152104.13278-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 04:21:02PM +0100, Ansuel Smith wrote:
> "qcom,kpss-wdt-msm8960"
> "qcom,kpss-wdt-apq8064"
> "qcom,kpss-wdt-ipq8064"
> "qcom,kpss-wdt-ipq4019"
> 
> and deprectaed and not used in the driver code at all. Drop them and
> fix the example.
> 
Rob may correct me, but I don't think you can just remove
deprecated properties. It doesn't matter if the driver supports
it or not; after all, DT property descriptions are supposed
to be OS independent.

Guenter

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.txt | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> index 41aeaa2ff0f8..33081bd33637 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> @@ -4,10 +4,6 @@ Qualcomm Krait Processor Sub-system (KPSS) Watchdog
>  Required properties :
>  - compatible : shall contain only one of the following:
>  
> -			"qcom,kpss-wdt-msm8960"
> -			"qcom,kpss-wdt-apq8064"
> -			"qcom,kpss-wdt-ipq8064"
> -			"qcom,kpss-wdt-ipq4019"
>  			"qcom,kpss-timer"
>  			"qcom,scss-timer"
>  			"qcom,kpss-wdt"
> @@ -21,7 +17,7 @@ Optional properties :
>  
>  Example:
>  	watchdog@208a038 {
> -		compatible = "qcom,kpss-wdt-ipq8064";
> +		compatible = "qcom,kpss-timer";
>  		reg = <0x0208a038 0x40>;
>  		clocks = <&sleep_clk>;
>  		timeout-sec = <10>;
> -- 
> 2.24.0
> 
