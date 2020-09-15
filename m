Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC0626AABE
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Sep 2020 19:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727712AbgIORdH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Sep 2020 13:33:07 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:46887 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbgIORb7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Sep 2020 13:31:59 -0400
Received: by mail-il1-f193.google.com with SMTP id u18so3731622iln.13;
        Tue, 15 Sep 2020 10:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yVi5xnX4p8lSfG5Fal6ZqXPlZtQ5bPZ2/aXDtcJUP0I=;
        b=FwSqxMWDlOSQVz+IHsXPMHW73kUavH8Dv0lowVQkurxKP/CeZSiDiSF+K0PnVfWvbp
         20EP7fbueqqWN9KKfd+pOuOz9k7NvQ86cnL/mFDBjSqAioAXEpG4dPcvBhCS67esx3S3
         e2bIRo9fSU+usklutd6MnONS8nDcCt2tG4dOwOxiugqeg2ukhCyDCk0GNzjpb7BYddIQ
         yeXLePGQ8pDnzo9ne2B9wlUh1F5vgiehoetvI9+ePYvK2t0y3dPCx5IfyyKyRR9vaTK1
         acai4ELnU5UF5O5fHPOw4dToOp1i/WN972d4CuihvgTGLaqHiurvd7C2rE6NIvN9GSTG
         WCkg==
X-Gm-Message-State: AOAM530vJU+A9l7+KNubsanIt2+16+rJcrky2FKlxxKApDtVfS6mLmtN
        76N0LMRMgbcITSVfnIQoSXxXXAHuOMrnI7g=
X-Google-Smtp-Source: ABdhPJy9Sk4x7neSoHAlgGHnx1tUXFxyUt/zkTYMK4i43CGrBQjmuVfQJ9YV10sdHojRS/Q9D+UR9Q==
X-Received: by 2002:a05:6e02:8f:: with SMTP id l15mr4387437ilm.119.1600191117864;
        Tue, 15 Sep 2020 10:31:57 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m5sm87897ilc.79.2020.09.15.10.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 10:31:57 -0700 (PDT)
Received: (nullmailer pid 2173763 invoked by uid 1000);
        Tue, 15 Sep 2020 17:31:55 -0000
Date:   Tue, 15 Sep 2020 11:31:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Viresh Kumar <vireshk@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: watchdog: sp-805: Convert to Json-schema
Message-ID: <20200915173155.GA2173707@bogus>
References: <20200909105046.160991-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909105046.160991-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 09 Sep 2020 11:50:46 +0100, Andre Przywara wrote:
> Convert the ARM SP-805 watchdog IP DT binding over to Json-schema.
> 
> A straight-forward conversion, but the requirement for providing two
> clocks got strengthened from "should" to "must".
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> this is just the bindings conversion patch, updated to address Rob's
> comments:
> - Remove redundant primecell.yaml inclusion
> - Reference watchdog.yaml
> - Drop now redundant timeout-sec property
> - Add unevaluatedProperties
> 
> The DT fixes are independent and now partly already queued, so I am
> posting this separately.
> 
> Cheers,
> Andre
> 
>  .../bindings/watchdog/arm,sp805.txt           | 32 ---------
>  .../bindings/watchdog/arm,sp805.yaml          | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> 

Applied, thanks!
