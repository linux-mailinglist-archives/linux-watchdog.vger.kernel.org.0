Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C6B2AF96F
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 21:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgKKUD7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 15:03:59 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45266 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgKKUD7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 15:03:59 -0500
Received: by mail-ot1-f68.google.com with SMTP id k3so3293740otp.12;
        Wed, 11 Nov 2020 12:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/IvxSxqDsjPntAEOWB4PNy7P7SXXxs0HSuipSbVZsp4=;
        b=O+0QyybVRza+3nJdrR8B6ZRyJQ2ebfmUCDYZ9SOVjTmWVLeMmh7iBVqk4DxjOCrw5S
         zqNPl4QEzAw+yvOX5iJBeHIRhldTrtqbsRIgU9CSJI3mc4vF50u8J6IXkaSxsM2/gaQc
         VvtyNx9VtuEdV0MMnfLE9Y11SV1Dos7pNRnB9GXxCv2NczAZm6KdfvImB4byMC2nBs6J
         C8xdEe+w/cuAjzEG9Sd7S7TYUbY8MTpDPsfsVXrTCTpp4s6iJCltpQj47+AjHpOSAAsd
         r7LwNH5nHV2/YXS183zTnAIFzfDPLyLefFPmPKk7RLG421nbHjESnd+IwU9nJpNlsEn0
         Z38Q==
X-Gm-Message-State: AOAM533PA+L6Ud/N2O9kftk3j5u6cSKg7xWKqEc5GyXfa1kM71YP7Gyw
        M5qGGS73LzdjRNVSXigQHQ==
X-Google-Smtp-Source: ABdhPJxXMiVyx9vlcisjS1XuPmq5k3KS8uiUoMyhzXRPwegwLn5O/ogSFFbR4kEn4OtzsGvvQDpS1g==
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr3390678oth.268.1605125038510;
        Wed, 11 Nov 2020 12:03:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m3sm651822oim.36.2020.11.11.12.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 12:03:57 -0800 (PST)
Received: (nullmailer pid 1934247 invoked by uid 1000);
        Wed, 11 Nov 2020 20:03:56 -0000
Date:   Wed, 11 Nov 2020 14:03:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     vijayakannan.ayyathurai@intel.com
Cc:     wim@linux-watchdog.org, andriy.shevchenko@linux.intel.com,
        devicetree@vger.kernel.org, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        robh+dt@kernel.org, lakshmi.bai.raja.subramanian@intel.com
Subject: Re: [PATCH v2 2/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Message-ID: <20201111200356.GA1934066@bogus>
References: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <e5b874280fded0a90f7a94b03ab1bbbae4a72ac6.1605028524.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b874280fded0a90f7a94b03ab1bbbae4a72ac6.1605028524.git.vijayakannan.ayyathurai@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 11 Nov 2020 01:53:08 +0800, vijayakannan.ayyathurai@intel.com wrote:
> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> 
> Add Device Tree binding document for Watchdog IP in the Intel Keem Bay SoC.
> 
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Acked-by: Mark Gross <mgross@linux.intel.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../bindings/watchdog/intel,keembay-wdt.yaml  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
