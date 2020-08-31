Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8B2257285
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Aug 2020 05:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgHaD4E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 Aug 2020 23:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHaD4D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 Aug 2020 23:56:03 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997BDC061573;
        Sun, 30 Aug 2020 20:56:03 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so3589198pgl.3;
        Sun, 30 Aug 2020 20:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPvqT5MBKDqJFIzQQKLIBGOzXfazoVXUPvdY/XCVcsQ=;
        b=Zsm0uIaJ2Ysuzrin8V+yX101K+bGyz3LZIxhPoY5oHonRFynGVDVUWW7s4apbZft9F
         vws6yFx2ss2+NYtRkRs+KFVzsbYP8Sb0i24czgs8LZxiPfuQs7nAQO1pHiy8fscjuNTt
         6MbzXGNv9CmrwRgGn4NjAM+pjWy6UWD2gRmarr9cJ8Nj4SvPS1V7FFNLGV0YIWACpNF5
         ADGqxQmmdn87GqrfzZ4C9iZaukRRWArT+vqEcimOrhSd5S5QVdTeY7nLpjYKQBJlNIcC
         y0M2+a/0LplOrJsZERu3Fed9l/djAz1NQjYWR6k0PRkM5F4vwSEBZGLKokVeIR7+idQi
         48Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPvqT5MBKDqJFIzQQKLIBGOzXfazoVXUPvdY/XCVcsQ=;
        b=TtOoI4VYvPWrJOWPgbfbJZo2OAomqU0o4gwy5JpoTG1dAV0FpB/9ova3BFLiIFYVGO
         VJDp+Xh/zS+3zJlWpqNhBNqq96gMAXtXMPVh3Kqxdp2zM2Vi7c7X8teEnEQEoGM6L00f
         EY6UKeGFlhXsHoVyHtdpOILi28+SoS7d8hIsNDUsFMBNvMxbEzVMqeiIu55aKl39fCy7
         duEIcEg7CKsIqtblJGvfzxJY9htqHnPVysfUHsXDTOifT6/ZNKVbV3XeUwVDG0Kni3y+
         zgo1j7yOkBoj+C8J9SjbiiI4+55H6vYNwpOL//xCb51DpZHs1QlDnP/Rn7QoAjLM3gJi
         ITAA==
X-Gm-Message-State: AOAM533yiRuWrjrajTV7BXkl8GP4y3XTTxOxM+gdvk2h05BYl8O2cy0s
        x0wFocSFiN6YI4hkTuE7TMg=
X-Google-Smtp-Source: ABdhPJydm5bIN9G7jSsjYH0yVpFWmYhUPzLMWIhaFn6qPm7BX5Cpl2GcrpjBN3FahTdn4RpQP5i8RA==
X-Received: by 2002:a63:4643:: with SMTP id v3mr6962450pgk.269.1598846163148;
        Sun, 30 Aug 2020 20:56:03 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id js19sm5347533pjb.33.2020.08.30.20.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:56:02 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH 09/10] ARM: dts: NSP: Fix SP805 clock-names
Date:   Sun, 30 Aug 2020 20:55:54 -0700
Message-Id: <20200831035554.1332246-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828130602.42203-10-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com> <20200828130602.42203-10-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 28 Aug 2020 14:06:01 +0100, Andre Przywara <andre.przywara@arm.com> wrote:
> The SP805 binding sets the name for the actual watchdog clock to
> "wdog_clk" (with an underscore).
> 
> Change the name in the DTs for the Broadcom NSP platform to match that.
> The Linux and U-Boot driver use the *first* clock for this purpose
> anyway, so it does not break anything.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Applied to qspi-fixes, thanks!
--
Florian
