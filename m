Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C4D445108
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 10:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbhKDJYb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Nov 2021 05:24:31 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:37704 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhKDJYb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Nov 2021 05:24:31 -0400
Received: from [10.104.240.139] (unknown [195.176.0.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 6A13B26C27B;
        Thu,  4 Nov 2021 10:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1636017712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y70bAvqnCv4oVjmWTcG3uLPetllC23Wd0oU9QdEYhIo=;
        b=E/+HXaAGvMgBUpuiKfMI76bfoc0rO7n3cmhDQCTnvjE6CRMwlGypRTkbxqq2ndIYbz3Sf4
        wP6xQJ8j93JTBDU5rhrEa8YbFw96yYRcH4yBS+OIX2xOMvvYfKnQbIe8UgMD4DAUHDNGiU
        IN7AJ0BySc+I90iNHe293EJrXwXvPthYV/oeapyZIVD16UcE72wxNOZTxZAkqn/1BD33qs
        +AX5FOhrRKkSwCJgRm2wtxrj7SDDCVJQhvQxD93hgCeLehWbOAoPwbahqAjHZHSrCQ9E9W
        WL7BAFIql5q8TgMAof9ZqlhV5EE/PSpq8aS6VuFdXh1kAfOtEX0REx3x3ykH+A==
Message-ID: <d8d5f82e89151b09098ed0cf3f5b0827d2868cd7.camel@svanheule.net>
Subject: Re: [PATCH v2 2/2] watchdog: Add Realtek Otto watchdog timer
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Date:   Thu, 04 Nov 2021 10:21:50 +0100
In-Reply-To: <20211104085952.13572-3-sander@svanheule.net>
References: <20211104085952.13572-1-sander@svanheule.net>
         <20211104085952.13572-3-sander@svanheule.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 (3.42.0-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 2021-11-04 at 09:59 +0100, Sander Vanheule wrote:
> +       do {
> +               if (prescale > OTTO_WDT_PRESCALE_MAX)
> +                       return -EINVAL;
> +
> +               tick_ms = otto_wdt_tick_ms(ctrl, prescale);
> +               total_ticks = div_round_ticks(timeout_ms, tick_ms, 2);
> +               phase1_ticks = div_round_ticks(timeout_ms - pretimeout_ms, tick_ms,
> 1);
> +               phase2_ticks = total_ticks - phase1_ticks;
> +
> +               prescale++;
> +       } while (phase1_ticks > OTTO_WDT_PHASE_TICKS_MAX
> +               || phase2_ticks > OTTO_WDT_PHASE_TICKS_MAX);
> +
> +       v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
> +
> +       v &= ~(OTTO_WDT_CTRL_PRESCALE | OTTO_WDT_CTRL_PHASE1 |
> OTTO_WDT_CTRL_PHASE2);
> +       v |= FIELD_PREP(OTTO_WDT_CTRL_PHASE1, phase1_ticks - 1);
> +       v |= FIELD_PREP(OTTO_WDT_CTRL_PHASE2, phase2_ticks - 1);
> +       v |= FIELD_PREP(OTTO_WDT_CTRL_PRESCALE, prescale);

I dropped the prescale_next variable here, but now the wrong prescale value is used
after the loop. I'll send out a v3 shortly.

Best,
Sander
