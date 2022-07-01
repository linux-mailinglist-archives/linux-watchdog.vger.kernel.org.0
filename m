Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC51956388A
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Jul 2022 19:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbiGARSp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 1 Jul 2022 13:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiGARSh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 1 Jul 2022 13:18:37 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2B31C93F;
        Fri,  1 Jul 2022 10:18:31 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id m13so2942638ioj.0;
        Fri, 01 Jul 2022 10:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PFQGOqlljXiRSYtbzBCxWxunidBwr6LAgqrSKKNNtVg=;
        b=acMlftOc66yJEogq2/DgGRbMYUGhRg2q5Jx8UiPkeMF/rs41VcOsmRAefQHXptPVOo
         8+UlZ7mgFlW06ots4vSjhgQ9PHi3uDMt+l66u6qshvW+lrMy+JyCrLEp/tc0sgWv+cQ0
         0/ybvwUOsTYwQ+LI36wo21MOYeh/eoZtNWX/sowT6zMMsiGvptXyO7ttq6bH5yHzgpYO
         B0nEjxPJkwOFfmSnEb1XHYFSyZo0CE0zTXRvAH7zxYJ9daS1QU7ns4i7Zt2duiqnIgjq
         ao3yjkrz9G55yk0VJN4WZHZ0WbVKaiFOu0Yr7+UHHCjoTtHFUhKwrnkNn872APj9jJiR
         eCMg==
X-Gm-Message-State: AJIora+K4muqwV8R3hzYY/B8bPmuk3e+d4jzjzX4vWpdVs2WRuFINvpr
        KZTNpmuCRvByXZa6E3At2RceFxV3eg==
X-Google-Smtp-Source: AGRyM1tPfAZ7gSG0SBGRBaU2tvJGzmEaLz5+Kef4bjzbMA+nTR70HpG1i/tYpSEph5CD7RcOMF21xw==
X-Received: by 2002:a5e:a619:0:b0:674:fdd4:43c3 with SMTP id q25-20020a5ea619000000b00674fdd443c3mr8209917ioi.49.1656695910845;
        Fri, 01 Jul 2022 10:18:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p16-20020a92d690000000b002daa70b6a83sm4758494iln.20.2022.07.01.10.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 10:18:30 -0700 (PDT)
Received: (nullmailer pid 1162450 invoked by uid 1000);
        Fri, 01 Jul 2022 17:18:29 -0000
Date:   Fri, 1 Jul 2022 11:18:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Isaac True <isaac.true@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net
Subject: Re: [PATCH 2/2] watchdog: gpio: add configurable minimum interval
Message-ID: <20220701171829.GA1149706-robh@kernel.org>
References: <20220629110626.2158127-1-isaac.true@canonical.com>
 <20220629110626.2158127-2-isaac.true@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629110626.2158127-2-isaac.true@canonical.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 29, 2022 at 01:06:26PM +0200, Isaac True wrote:
> Add the "min_hw_margin_ms" parameter to gpio_wdt devices, allowing a
> minimum interval to be specified, stopping watchdog devices from being
> fed too quickly if they require a certain interval between feeds.

I assume there is some real platform with a real problem you are trying 
to solve? Details please.

Can you just hardcode some min? Maybe 10% of the max or something. Is 
there a downside to a larger than necessary min?

Wouldn't be better to fix this without requiring a DT change and that 
could work on stable kernels if needed.

Rob
