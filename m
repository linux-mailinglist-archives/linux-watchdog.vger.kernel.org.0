Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA82E4315BC
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Oct 2021 12:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhJRKTM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Oct 2021 06:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhJRKTH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Oct 2021 06:19:07 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4D2C0613DF
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Oct 2021 03:16:30 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id on18-20020a17090b1d1200b001a04d94fd9fso7548516pjb.2
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Oct 2021 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=oY7miojajBsvdF3HUMaS1feE4pIqN0wiCXEms77CPnU=;
        b=gocHWodpj1y3RO74fcCC1l5rTkjYEX63jbzk4uPVGXLoZBssxTA641D0KRQ7Px6ol7
         Uy463QdXHg2f6fow9IKru0iQZrSPCHnLYpcd8hfQ2zKWIzPRdMEf97R3oOcvTNeApZGb
         ZzdhjXQPNBdXqnn7nrPFJUkaN2UFpowkQ/FACzdsdeYa0xS1QN7y7t5SQAu2MVk8QvUo
         YTiwGQud5dfd6G7YEOs7Hj162ebHr9v6GPL1J3ctY1m9Gx0I42JV7HOnIwYa06PYCmDp
         uW8N/ele3Gt1rYLG8Pye2O/ZARSZ0z2PBl7BSG1C4e0Ln1ISfiBeRg7oQSLo/DGfl/DC
         qw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=oY7miojajBsvdF3HUMaS1feE4pIqN0wiCXEms77CPnU=;
        b=QddVXI5pqGBXBUULcGQpmfOtjG23Mc5tOalN9o8RwegB7eYC84BYu9O1ozRn5bp11r
         pADvSOV/s0hTGldTSGcPbBmKby3hvut26gBbA9NO0AQeWCn54eO5Iz0pg4zqNyx6I44I
         2ADTLpJIi9Wh7TZbCgZrrhku+tekkgEaKlFB7sxMMg/+e/irLkXSPwcVLbZ/Vm9f4aIn
         70+b4AiV0w4mvjlcGRoEnLZ0BfwFPAgMgrJcybP4ldmeCwA08TGa/kYT3OLYoRH4eJY5
         aThtvQ4+zisZM0GMuFv0ex/7C52HijnJw6w9L6nCpSD5uuotmgl/MZqXlUfElkoeqIgk
         pzBg==
X-Gm-Message-State: AOAM530waW0ZxAM9sSm6Kbfague6z0UmeF7fdybkdvpNBmD5qUnxtRqq
        n8TYksaCyZV0hdDcdfFuie+FyzJXzHwL
X-Google-Smtp-Source: ABdhPJxVXkwD7Z4p19zoY0d6mrWKkV0hcUjQUx0QD9KXka6554CXjU42fH+hYE1xRvsAkQZcAaWr6WHqk0Ff
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:e23e:fe98:6410:7fad])
 (user=tzungbi job=sendgmr) by 2002:a17:90b:1d85:: with SMTP id
 pf5mr31883714pjb.64.1634552189741; Mon, 18 Oct 2021 03:16:29 -0700 (PDT)
Date:   Mon, 18 Oct 2021 18:16:08 +0800
Message-Id: <20211018101608.3818840-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller headers
 in DT example
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     alsa-devel@alsa-project.org, tzungbi@google.com,
        devicetree@vger.kernel.org, enric.balletbo@collabora.com,
        linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
constants into common location") moves the reset controller headers.
However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.

Renames the DT example to pass dt_binding_check.

Fixes: f07c776f6d7e ("arm64: dts: mediatek: Move reset controller constants into common location")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch bases on next-20211018.

In Mark's tree[1], the commit f07c776f6d7e hasn't shown up.
In Matthias's tree[2], mt8192-afe-pcm.yaml hasn't applied.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/

Also, I am not sure if the commit hash "f07c776f6d7e" would change
or not after it applies to mainline.

 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 5e9fe067f440..7a25bc9b8060 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -74,7 +74,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/power/mt8192-power.h>
-    #include <dt-bindings/reset-controller/mt8192-resets.h>
+    #include <dt-bindings/reset/mt8192-resets.h>
 
     afe: mt8192-afe-pcm {
         compatible = "mediatek,mt8192-audio";
-- 
2.33.0.1079.g6e70778dc9-goog

