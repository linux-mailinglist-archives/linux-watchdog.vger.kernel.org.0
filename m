Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C1412661E
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2019 16:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfLSPvF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 19 Dec 2019 10:51:05 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44361 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbfLSPvE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 19 Dec 2019 10:51:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id h9so5154806otj.11;
        Thu, 19 Dec 2019 07:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ci18yO6S0a6TgITq8YqQaAsiIr5weNY4GfvU653cx3c=;
        b=VC+Y+hcako2fcT9ROIo94NgIzt6kQEChyV60kQWUD2Zi6PvdthjF5BsCC9b2vYHsHu
         dge7eDe4tva+JtUP0/XpsH6taJD58UHoU1JaQDNiTHupH+PVd0NX/DaOAVylzOX6Hjsi
         KWX7SNCMPSUk+mriTL3gj8/2LAMsmThC+c015x+VQAutDFlNWwUUfcgreLwB65mauU0t
         hECB5dkDc+wtng3ZepCyacFecMpjACogy2wuo2ne8d7yzxjvrkfvlKt7n6/h4QKIMLm0
         Q51LaVSGEylJwAPn7GcuAO/jB5pAKZqaB/l51137nN8dOVWBtpRPjhtMLxC0zoNMwyon
         77pQ==
X-Gm-Message-State: APjAAAXynfYFbWB8RzFHq++2ZjeQk+Jf8Y1xR32fsje/XPxRwcWFedGR
        mKhjMp+huFsr4wxSMXS+wQ==
X-Google-Smtp-Source: APXvYqxBitxJErG8fqxh+172fCWcJiax2apTWgRol/iP7/vlCUvpXo+dEXMMyBU3q5UoTCa+0/Od8A==
X-Received: by 2002:a9d:7a8f:: with SMTP id l15mr9106619otn.109.1576770664003;
        Thu, 19 Dec 2019 07:51:04 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm2092339oic.22.2019.12.19.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 07:51:03 -0800 (PST)
Date:   Thu, 19 Dec 2019 09:51:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, mark.rutland@arm.com,
        alexandre.torgue@st.com, linux-watchdog@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: Convert stm32 watchdog
 bindings to json-schema
Message-ID: <20191219155102.GA26498@bogus>
References: <20191121084316.13839-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121084316.13839-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 21, 2019 at 09:43:16AM +0100, Benjamin Gaignard wrote:
> Convert the STM32 watchdog binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 2:
> - remove trailer space
> - add Christophe in the maintainers list
>   
>  .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 ----------
>  .../bindings/watchdog/st,stm32-iwdg.yaml           | 55 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml

Fixed up a typo with 'enums' and applied.

Rob
