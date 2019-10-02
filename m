Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85AF4C48C2
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 09:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfJBHse (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Oct 2019 03:48:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50423 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfJBHse (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Oct 2019 03:48:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id 5so6033324wmg.0;
        Wed, 02 Oct 2019 00:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uUwiwhPBSc6eZHDkUDyAm/N9CoHzCdtlpM4L3BcW6Vs=;
        b=QpuQCDssiev7YWv8DTEHEZnH5UNakW47BFvGSDNmJI+CkBIePeFGgbnqz2pkKJwcn/
         ubYC1fqlTtxefep4F5Na4a6eoq4VWlZ9faq6s+VVVlMsaU+OVyGrdUZ/bljB9dUYs3iz
         7YTk3xD5ZTc7VLZDWk+Y7VP3+8HITVDO7MRiOrfVfDXo4d/xUFR7TFxefr86YRxBm6qT
         ren3fUUI1WusQwvPMoAvD98mL0UqX4zdiyEdyjPzT5ygWzMtTItc83Qgh6+rdmS17BAk
         PvCzbkqtnlFEGSSlgvHpY4hKur8njhGKbyH1Pou2Wtdc28Z4eov03jX+B2IGiDt91UXo
         DQKA==
X-Gm-Message-State: APjAAAWk4KQdigEo1EPKkE9WMlsMaHK0qVWDq8akFDWm2nsFbjIqAWy2
        /pefLGKWZ6DDZH0PXAor5nM=
X-Google-Smtp-Source: APXvYqw/hPJSvkHymOuwy555wjGEibmOYvrrxzqTT/bFUufzfpe7zbAT7CsUQbeP3t/GED9kDBYwtw==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr1828304wme.26.1570002511763;
        Wed, 02 Oct 2019 00:48:31 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id 207sm8289456wme.17.2019.10.02.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 00:48:31 -0700 (PDT)
Date:   Wed, 2 Oct 2019 09:48:28 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
Message-ID: <20191002074828.GA6221@pi3>
References: <20190920162124.7036-1-krzk@kernel.org>
 <20191001222109.GA26050@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191001222109.GA26050@bogus>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 01, 2019 at 05:21:09PM -0500, Rob Herring wrote:
> On Fri, Sep 20, 2019 at 06:21:22PM +0200, Krzysztof Kozlowski wrote:
> > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > using json-schema.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Indent example with four spaces (more readable),
> > 2. Remove unneeded timeout-sec description and include generic bindings.
> > ---
> >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> >  .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
> >  2 files changed, 65 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Rob,

The generic watchdog YAML/DT schema is already in v5.4-rc1 so this can
go either trough you, or through watchdog tree.

Best regards,
Krzysztof

