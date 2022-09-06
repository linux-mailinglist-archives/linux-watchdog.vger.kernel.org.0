Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 510CB5AE80C
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Sep 2022 14:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240074AbiIFM0Z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Sep 2022 08:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240101AbiIFM0D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Sep 2022 08:26:03 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB367C193
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Sep 2022 05:22:18 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t7so10156716wrm.10
        for <linux-watchdog@vger.kernel.org>; Tue, 06 Sep 2022 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=etRB1TES3HElT9FZpWWrbjBF4Hgq+Rpw7WzQMwgRKNE=;
        b=kVixT+G6sAyrpaX+Jd8i/qmqWAcqP2A3HuzTN1EChZncqgmuKzSTWSFrblBcz5EAiM
         X2IPpyBmI5kXEr8xKlGZOTxMWGyzwC+hfNtVSNpBYqNniW26uQbY8zwFEFkMKLWrEsCu
         TZMJ7w0BXNIDIa453ocHAw1KTaoAcyvxFwZvE6Dnzr0o+kBE0C9mN8pZzOfGAm3vmfHZ
         4uMDGOnoS9liSq0upmAI6Of8riDPaOq3l1rN3o/nj2CBSSx79jH49JzB7XAVSvcAeJjx
         CseJy7IlPQ8siNDKZ6CasGBV4kcRhH+iosul04RbdS5Y0PEsEDagKQabqCQ13Sqe938P
         XoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=etRB1TES3HElT9FZpWWrbjBF4Hgq+Rpw7WzQMwgRKNE=;
        b=Fs69wr3a64HQNANwj9CKe34YTD2OBQTbV18oTbpxdMvC2V4+7z+QCR9TX6S6YV/bTn
         T+Y7i2wfYRrOfKK/jmYjonlPRvtPDL7HzIy7z229mHUc5X8K34GLxVuFiU3dEDliBy+J
         usvBtYIEdPg4SM8fYmeF7iqz6aveYCre/wMPN4VAYygp8UsUtmX3rRQuYP6NT3awakT0
         2ipBzthhxk2eTorWbfERp0ENKFn03rWJiYMQl3McVg+bKgiJ0I+IDfFJkVoHGQ1yJTHi
         BDgtHi4ZZxIf0NKEltXB7VhAMKfNEcw/+GV3PaN3rEB23FQy5b18opHjyoSJa+rI/ZTr
         txaA==
X-Gm-Message-State: ACgBeo1+HUNjMoUmvn7mEiMnJtUfkP8I32IWuZ1zv9dsHTfcdtT604lj
        QPEF9JbAF0GV6SXjY7rMpecNew==
X-Google-Smtp-Source: AA6agR7cXoWdXaVb+PdspVN/tctRjn4oDvh3CI43TFmWbSs0DrYVCD8dkd/BVjD6tQpyPJhgsAmjjA==
X-Received: by 2002:a5d:5143:0:b0:226:de76:be7b with SMTP id u3-20020a5d5143000000b00226de76be7bmr22345327wrt.308.1662466935841;
        Tue, 06 Sep 2022 05:22:15 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003a3170a7af9sm15588545wmq.4.2022.09.06.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:22:15 -0700 (PDT)
References: <20220801092150.4449-1-pboos@baylibre.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Philippe Boos <pboos@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "moderated list:ARM/Amlogic Meson SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson SoC support" 
        <linux-amlogic@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] watchdog: meson: keep running if already active
Date:   Tue, 06 Sep 2022 14:21:26 +0200
In-reply-to: <20220801092150.4449-1-pboos@baylibre.com>
Message-ID: <1jsfl4wv4a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On Mon 01 Aug 2022 at 11:21, Philippe Boos <pboos@baylibre.com> wrote:

> If the watchdog is already running (e.g.: started by bootloader) then
> the kernel driver should keep the watchdog active but the amlogic driver
> turns it off.
>
> Let the driver fix the clock rate if already active because we do not
> know the previous timebase value. To avoid unintentional resetting we
> temporarily set it to its maximum value.
>
> Then keep the enable bit if is was previously active.
>
> Signed-off-by: Philippe Boos <pboos@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
