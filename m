Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE4B13B722
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 02:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgAOBnt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 20:43:49 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34949 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728909AbgAOBnt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 20:43:49 -0500
Received: by mail-oi1-f195.google.com with SMTP id k4so13924987oik.2
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Jan 2020 17:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iLGTssc9FHCMcOGMTyr/UYKoEZZS9tYZ4rHOO35XpvA=;
        b=o3ZsZW8f6wWvVAr8UHq7jq/aDbuL38ASs8GRNRGqhutv0Z27MSG3/+MA1dAnpBM8o0
         89/cWnstQtZyk9YmRQN48wXCTAxfdwBdv3xWY4tQRsSxXRBOMCP35a3WPLwMbPqFcv3e
         vGXvGSm2AhXsRLgqLjKLDZcM5O0plBw0xjkWqF0UnZs04QO71msOrPH6XjuD0mLn8oKQ
         EBf+70l1KM5S6lNKdjnGwWMPfU3LC4YtdPzg9Vswsgjq1kuPVwjR7SkU9SrkSwOEkyuB
         HLtkUWF1h+qMrZUiobw5MuFKP4m6zHrhSYaHy+yedXmBMz9MSAfrtRDL3OI9UHFtwHY+
         szWw==
X-Gm-Message-State: APjAAAWYGu9M99PhNUUex50bczwOS5qA1GRkSwkPKQxeJdQK90ouOBRu
        rOSERdDZAz+7fTf5wr1Qt5kqbbg=
X-Google-Smtp-Source: APXvYqyHse9ygopztaytMPsNRHzbIK+4JLh2XMvrpHuAspkBG/W+ejLHHVxRe6mzCUDBqgZ8dq91VQ==
X-Received: by 2002:aca:ab0e:: with SMTP id u14mr19845085oie.1.1579052628411;
        Tue, 14 Jan 2020 17:43:48 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l17sm6148325ota.27.2020.01.14.17.43.47
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 17:43:47 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220a2e
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 19:43:46 -0600
Date:   Tue, 14 Jan 2020 19:43:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, linux@roeck-us.net,
        robh+dt@kernel.org, lee.jones@linaro.org,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: da9062: add suspend disable
 option
Message-ID: <20200115014346.GA20553@bogus>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108095704.23233-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed,  8 Jan 2020 10:57:03 +0100, Marco Felsch wrote:
> Document the watchdog disable option which can be used if the hardware
> automatic suspend option is broken.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/watchdog/da9062-wdt.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
