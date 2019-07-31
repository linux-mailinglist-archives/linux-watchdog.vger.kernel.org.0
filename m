Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE947C85D
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 18:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfGaQRS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 12:17:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41235 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfGaQRS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 12:17:18 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so21927424pgg.8;
        Wed, 31 Jul 2019 09:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=tQGvQCpmlnU+YXLu2w7C0n2iX/nzWSa21UvWHckUC10=;
        b=uQF5NlkV8ZwIHKPJS3lgV0FZPFd3Stkxj/kzzFsceBPTfheRjA4o17TCjWctMq3ccY
         4Ka5UA2dVPMeOjOueBfgvj+yxdAukhdt0iEUYb1dYPlzXo2Er/QSIbyEHjgeBjtMcjdU
         kO8gKA0n8tB4vXAz0OO6tSzHDtyEbSi0X15LjfiifsE+sM+jIlCr/xKEaUdxSMLw8uq5
         Ynt6MGv0GXOVeKrxgiOYY1iL30djK6zyL1K6JfjKhW9lalmDvXDBFt7YrTdGve9i+cT2
         GsjWE9BvMiVD48Cov9O/7isgyzThuOp1SdDuoXWu1ZpIt3Q8VPdR34fC8PjXrQ4DtAbf
         VSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=tQGvQCpmlnU+YXLu2w7C0n2iX/nzWSa21UvWHckUC10=;
        b=qNbp8iXgsGcuN1AVs5h/YOqHRsbEZGoZgwOIoE5wmCGSzBmKs02CoOz0P3HvULid70
         kZr7hC7Hfa0L7VEra1BYvcDCnKab3TaubxR0FPXiiKYbODi5ddL3qyeEjxNyJMOzShFU
         JzTbFAcOp2v++PEtfK5w9xnQcSfD7IBl2MCVNrrBg72MDKhMWKctjEONNvVVSNWPqv9Z
         Rn0aGXw8Wh1ZRtTPyIyo3bjmGJGmTdS5PLalYUPNIVf/JgQwwSspyzjW1YCCaexJADrV
         ukybRL2Ggkq0agIHOhcxkHDtzhtY3Zv3zksL5EvEnWYI1+hnhaU5mPyNqYq9F6bE4I0K
         75cg==
X-Gm-Message-State: APjAAAU0Bju28fyP4GQGuQi4KYUR2kcbGobBLLiYfWBgXFHi3ZcknLxl
        D+1d9XxVB5cyUA0tYXtns6M=
X-Google-Smtp-Source: APXvYqyH6+n839IXC0b7QE+qMyzEScmkC37wIWWFxdSAJuOcIKb8QG7tVaxQb/joOYkXR+jilndC0Q==
X-Received: by 2002:a17:90a:24e4:: with SMTP id i91mr3920986pje.9.1564589837614;
        Wed, 31 Jul 2019 09:17:17 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id v184sm68795879pfb.82.2019.07.31.09.17.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 09:17:16 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Wed, 31 Jul 2019 09:17:13 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Mark Balantzyan <mbalant3@gmail.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer()
 concerning ali_timeout_bits variable.
In-Reply-To: <20190718163458.GA18125@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1907310911120.29703@mbalantz-desktop>
References: <20190718155238.3066-1-mbalant3@gmail.com> <20190718163458.GA18125@roeck-us.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

If it's not too much too ask, I also propose to rewrite alim1535_wdt to 
use the watchdog subsystem as I believe we are making progress toward the 
similar end in pc87413_wdt, as my evaluation ends in some weeks.

Thank you,
Mark

