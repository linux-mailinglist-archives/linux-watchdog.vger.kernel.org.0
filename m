Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D275113B543
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 23:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgANWWZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 17:22:25 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38572 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbgANWWZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 17:22:25 -0500
Received: by mail-ot1-f67.google.com with SMTP id z9so12152069oth.5
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Jan 2020 14:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yb6xHORuBeJhfPujkVSQ5MYYi1HxS0bOoVjowX+c/ks=;
        b=Db6GwbZHe2I5szB8c9alfXs9+dVFC/I7YRz0BDDVnO8VSc8zO/R38/h4loOpL4GZKq
         VnYblIbAxFl8bJX4BsAIKuEXVQpAQnWenxhI9+lZ2HWOe42SrkhvQvzDwyRSZdtwHqXG
         AiLcWfstTZytEn3+Bkqqvuensf2k/q/2afmQhASr9siij1Rb91mEsHFpTUg3FuAtFFXb
         PAYc2RBL40+I3mYMnYziXj2a4GRU2VgDd3z5GsXnozVCHMxPBMNin2r/9t548/C8UXJT
         OXazOj/tWiITnJVTINf4Rw00fCyZvAYZBM8P471PEGyvpAH4Spro52fcHKFUQ5PFXStM
         wiFQ==
X-Gm-Message-State: APjAAAXuWAysNB/h0/ax6H/aujsDJnXNHL14V8F8EzAr7MNasSrhB/1N
        NU+ydOLVZ/tf5a4fuJnPi+/W7lA=
X-Google-Smtp-Source: APXvYqwxgYV6i3O7y7SIvU/1nqBPOyU9MGVJvRF9imqGHTfPDmBcbhJABPrj9zTekij1HLjZvCopNQ==
X-Received: by 2002:a05:6830:231d:: with SMTP id u29mr486376ote.185.1579040544376;
        Tue, 14 Jan 2020 14:22:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y6sm5815822oti.44.2020.01.14.14.22.23
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 14:22:23 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221a3a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 16:22:22 -0600
Date:   Tue, 14 Jan 2020 16:22:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>, linux-watchdog@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: watchdog: add new binding for meson
 secure watchdog
Message-ID: <20200114222222.GA21654@bogus>
References: <1578973527-4759-1-git-send-email-xingyu.chen@amlogic.com>
 <1578973527-4759-4-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578973527-4759-4-git-send-email-xingyu.chen@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 14 Jan 2020 11:45:25 +0800, Xingyu Chen wrote:
> The binding targets the Meson-A/C series compatible SoCs, in which the
> watchdog registers are in secure world.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>  .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
