Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E60C2D1877
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Dec 2020 19:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgLGSXx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Dec 2020 13:23:53 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33691 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgLGSXx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Dec 2020 13:23:53 -0500
Received: by mail-ot1-f65.google.com with SMTP id b18so13414069ots.0;
        Mon, 07 Dec 2020 10:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r8iujiXMsHVfC0xZaPOn5hqafsuzyJCL4bLhyC5L5cc=;
        b=bVRnYVFpecAonvg819Zesp6AizJhLI192tOAsth/FjX1zPr2sJmBoTeSyPkJuBGmvb
         kRUgrNHmukcOKwVu3MPbbe2e5QT1Mc2+GGXujobdthcggsLg/KFx133oiMNH8y4Da2Df
         k9jQvisvlbKnJ8Rqm3D0Cqp1YTgmXt/UyTdXJmD40gbh8H/9Q2XlwesnZ4i4DzhEtMyw
         uirzmgEpFva17fqMVSOyC7oxYmkVbXfbROykFFhLsIrY2fvDUty+odHPFsKN/NVobkby
         shNMjldaUD+ZsNi9QXYMU7rsaAIZgScWo4WbsCDtFGDIZQjWvvdelmLkkf+vtAq3clvo
         CHeA==
X-Gm-Message-State: AOAM532TJ8/TKjRckDkbeUvMbOL3KXx05NvRoh0rWrlQ2Q1dWvyJZCUb
        OISUyY6DPXU12jlEBSvH1Q==
X-Google-Smtp-Source: ABdhPJzCsVsxge4o+Meu07a/RWftrL8x0qdsqoSysO/4jD5LUHZRJ36KYdAzRFDw/cQvbWUozg+AuA==
X-Received: by 2002:a9d:2203:: with SMTP id o3mr14124765ota.107.1607365386725;
        Mon, 07 Dec 2020 10:23:06 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t13sm3090572oic.4.2020.12.07.10.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:23:05 -0800 (PST)
Received: (nullmailer pid 563512 invoked by uid 1000);
        Mon, 07 Dec 2020 18:23:04 -0000
Date:   Mon, 7 Dec 2020 12:23:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     vijayakannan.ayyathurai@intel.com
Cc:     wan.ahmad.zainie.wan.mohamad@intel.com, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        mgross@linux.intel.com, wim@linux-watchdog.org, robh+dt@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Message-ID: <20201207182304.GA563366@robh.at.kernel.org>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
 <c3ffd4c2becada82c631ca035a3a1a8f0bd38dc8.1606833303.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3ffd4c2becada82c631ca035a3a1a8f0bd38dc8.1606833303.git.vijayakannan.ayyathurai@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 01 Dec 2020 23:10:34 +0800, vijayakannan.ayyathurai@intel.com wrote:
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


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

