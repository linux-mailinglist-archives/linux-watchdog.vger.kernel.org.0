Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A563D9E49
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 09:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234379AbhG2HXm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 03:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhG2HXm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 03:23:42 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973E5C061757;
        Thu, 29 Jul 2021 00:23:39 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id e5so5906225pld.6;
        Thu, 29 Jul 2021 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJuA/NpuWl+d3R+BteDi/e4fE2gH3i5TrGEWA+dEzWE=;
        b=TbyylpUJVjyWOLR1WnvG2NLgS6cJmLxM3guk5GI8rAG0O1KKtvLnt+nNEHy9HAEqPo
         PrqNReglKvjR1+2UmolhBCGb2ZQnG66R5czmCdj1RAicVu4Vi6k3VglbeIbqyJ/CChZB
         jtWou7jAfhCd4snItUg+UQ6Uisgr/0HZoWGgMyYCupQv1KbD0rAVFe42k2zqx63v7Gym
         XIiwbsRZ3vCa6QzNOSrZFCVqgHZBEy2Nc0vlgOPpdOdi6SJlrF0MJ2fopjsb/JW7rBCo
         zBqRu0MTBK1Nuc+VITGPesbn9E6HCkREK2u92SLqG4/ctgpgpZSe9TLUuap989LWhGrD
         9rKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJuA/NpuWl+d3R+BteDi/e4fE2gH3i5TrGEWA+dEzWE=;
        b=FKHsNUTxa6GONObvPINyIqy0MpQcIHa1n6XviPfrHtQBUMgRZHxYDizfZw9G3BXZpm
         SoR4LEHUHikRIXYgCoLRl2gitxZNEgGUEiolIAkzbTVqLcdlzh3n8VIADcF3D48U/e4B
         PaEdERQacqfHMO5THVOFeGpd2bcjrpwsl85cmLc2nb2bDbUj6JCZcNKPmbSvnheBkWNX
         xssSS3FSKxohdsIdpEe+1aTEcqjTG38zdeqVAwbZfhP7Roh2/FVlOQffBkGsFwkm80D6
         cS5wS/A6g8xw/cDaklFdQCt3wJTKGWJ58hAzSDkRzyqU/xSFIqoRVjA+QHZy7RpfeXhc
         7gZw==
X-Gm-Message-State: AOAM532CcZzEZTF/Q2bbEmzADEr9UN6dv/LqGdQfRgv7XJx5QqIMSPsh
        yxT0RW4hrMTUdXsQp9Rr81N+2pV8YQ+DDAic
X-Google-Smtp-Source: ABdhPJw/eDhUTGjmPXJR5uvWdI2MNStKLTc4GCI1hYZOqMt6pMKfvLXG+GxowZcOl5a0V78/iiGG6g==
X-Received: by 2002:a17:902:d897:b029:12b:2624:8aac with SMTP id b23-20020a170902d897b029012b26248aacmr3385012plz.58.1627543419064;
        Thu, 29 Jul 2021 00:23:39 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 00:23:38 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 0/3 v3] watchdog: meson_gxbb_wdt: improve
Date:   Thu, 29 Jul 2021 15:23:05 +0800
Message-Id: <20210729072308.1908904-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Improve meson_gxbb_wdt driver

Source: https://lore.kernel.org/linux-watchdog/5229d62c-b327-254f-800f-1524f27491b3@roeck-us.net/T/
Remade using all suggestions from Guenter

* Added nowayout module parameter
* Added timeout module parameter
* Removed watchdog_stop_on_reboot (I feel that it is important to keep
the watchdog running during the reboot sequence, in the event that an
abnormal driver freezes the reboot process. This is my  personal opinion
and I hope the driver authors will agree with my proposal, if not just
ignore this last commit)

Artem Lapkin (3):
  watchdog: meson_gxbb_wdt: add nowayout parameter
  watchdog: meson_gxbb_wdt: add timeout parameter
  watchdog: meson_gxbb_wdt: remove stop_on_reboot

 drivers/watchdog/meson_gxbb_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.25.1

